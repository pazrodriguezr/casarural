package casarural

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.*

@Secured("ROLE_ADMIN")
class ReservaController {

    ReservaService reservaService
    HabitacionesService habitacionesService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond reservaService.list(params), model:[reservaCount: reservaService.count()]
    }

    def show(Long id) {
        respond reservaService.get(id)
    }

    @Secured("ROLE_USER")
    def create() {
        respond new Reserva(params)
    }

    /**
     * Método que muestra las habitaciones disponibles por categoría entre dos fechas
     * @param reserva
     */
    @Secured("ROLE_USER")
    def showAvaliableRooms(Reserva reserva) {
        def habitaciones = habitacionesService.habitacionesDisponibles(reserva.fechaInicio, reserva.fechaFin)
        render(template: "template/habitaciones", model: [habitaciones: habitaciones])
    }

    @Secured("ROLE_USER")
    def save(Reserva reserva) {

        //Validaciones
        if (reserva.fechaInicio >= reserva.fechaFin){
            respond flash.error = "La fecha de inicio debe de ser mayor que la fecha de fin", view: 'create'
            return
        }
        if (reserva.fechaInicio < new Date()){
            respond flash.error = "La fecha de inicio debe de ser mayor que la fecha actual", view: 'create'
            return
        }

        reserva.fecha = new Date()
        reserva.estado = Reserva.Estado.Reservada

        if (reserva == null) {
            notFound()
            return
        }

        try {
            reservaService.save(reserva)
        } catch (ValidationException e) {
            respond reserva.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'reserva.label', default: 'Reserva'), reserva.id])
                redirect reserva
            }
            '*' { respond reserva, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond reservaService.get(id)
    }

    def update(Reserva reserva) {
        if (reserva == null) {
            notFound()
            return
        }

        try {
            reservaService.save(reserva)
        } catch (ValidationException e) {
            respond reserva.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'reserva.label', default: 'Reserva'), reserva.id])
                redirect reserva
            }
            '*'{ respond reserva, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        reservaService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'reserva.label', default: 'Reserva'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'reserva.label', default: 'Reserva'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
