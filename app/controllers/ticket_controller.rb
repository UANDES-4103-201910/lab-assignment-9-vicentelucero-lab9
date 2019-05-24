class TicketController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)
    respond_to do |format|
      if @ticket.save
        format.html {redirect_to @ticket, notice: 'Ticket Created'}
        format.json {render :show, status :created, location: @ticket}
      else
        format.html {render :new}
        format.jason {render json: @ticket.erros, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @ticket.update(event_params)
        format.html {redirect_to @ticket, notice: 'Ticket Updated'}
        format.json {render :show, status: ok, location: @ticket }
      else
        format.html {render :edit}
        format.json {render json: @ticket.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html {redirect_to events_url, notice: 'Ticket Destroyed'}
      format.json {head :no_content}
    end
  end

  private
  def set_event
    @ticket = Ticket.find(params[:id])
  end

  def event_params
    params.require(:ticket).permit(:description, :price, :event_id)
  end


end
