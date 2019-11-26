require 'pry'

class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])
    end

    def edit
        @song = Song.find(params[:id])
    end

    def create
        @song = Song.create(p)
        if @song.valid?
            redirect_to @song
        else
            render :new
        end
    end

    def new
        @song = Song.new
    end

    def update
        @song = Song.find(params[:id])
        t = @song.update(p)
        if t
            redirect_to @song
        else
            render :edit
        end
    end

    def destroy
        Song.find(params[:id]).destroy
        redirect_to songs_path
    end

    private

    def p
        params.require(:song).permit(params[:song].keys)
    end
end
