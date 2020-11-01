class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(params.require(:song).permit(:name, :artist_id, :genre_id))
        @song.save
        redirect_to song_path(@song)
    end

    def show
        @song = Song.find_by(id: params[:id])
        @artist = Artist.find_by(id: @song.artist_id)
        @genre = Genre.find_by(id: @song.genre_id)
    end

    def edit
        @song = Song.find_by(id: params[:id])
    end

    def update
        @song = Song.find_by(id: params[:id])
        @song.update(params.require(:song).permit(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)
    end
end
