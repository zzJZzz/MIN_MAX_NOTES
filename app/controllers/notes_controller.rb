class NotesController < ApplicationController
  before_action :find_note, only: [:show, :edit, :update, :destroy]
  def index
    @notes = Note.all
  end

  def show
    @note = Note.friendly.find(params[:id])
  end

  def new
    @note = current_user.friendly.notes.build
  end

  def create
    @note = current_user.friendly.notes.build(note_params)

    if @note.save
      redirect_to @note
    else
      render "new"
    end
  end

  def edit
    @note = Note.friendly.find(params[:id])
  end

  def update
    if @note.update(note_params)
      redirect_to @note
    else
      render "edit"
    end
  end

  def destroy
    @note = Note.friendly.find(params[:id])
    @note.destroy
    redirect_to notes_path
  end

  private

  def find_note
    @note = Note.friendly.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
