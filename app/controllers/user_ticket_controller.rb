class UserTicketController < ApplicationController
  def index
    @user_tickets = UserTicket.all
  end

  def show

  end

  def new
    @user_ticket = UserTicket.new
  end

  def edit

  end

  def create
    @user_ticket = UserTicket.new(user_ticket_params)
    respond_to do |format|
      if @user_ticket.save
        format.html {redirect_to @user_ticket, notice: 'UserTicket Created'}
        format.json {render :show, status :created, location: @user_ticket}
      else
        format.html {render :new}
        format.jason {render json: @user_ticket.erros, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @user_ticket.update(event_params)
        format.html {redirect_to @user_ticket, notice: 'UserTicket Updated'}
        format.json {render :show, status: ok, location: @user_ticket }
      else
        format.html {render :edit}
        format.json {render json: @user_ticket.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @user_ticket.destroy
    respond_to do |format|
      format.html {redirect_to events_url, notice: 'UserTicket Destroyed'}
      format.json {head :no_content}
    end
  end

  private
    def set_user_ticket
      @user_ticket = UserTicket.find(params[:id])
    end

    def user_ticket_params
      params.fetch(:user_ticket, {})
    end
end