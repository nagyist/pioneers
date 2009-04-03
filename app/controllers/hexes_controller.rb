# -*- coding: utf-8 -*-

# Pioneers - web game based on the Settlers of Catan board game.
#
# Copyright (C) 2009 Jakub Kuźma <qoobaa@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

class HexesController < ApplicationController
  before_filter :fetch_game

  def index
    @hexes = @game.map_hexes
    respond_to do |format|
      format.json do
        hexes = @hexes.map do |hex|
          hash = {
            type: hex.hex_type,
            position: hex.position
          }
          hash.merge! harbor_position: hex.harbor_position, harbor_type: hex.harbor_type if hex.harbor?
          hash
        end
        render :json => { hexes: hexes }
      end
    end
  end

  protected

  def fetch_game
    @game = Game.find(params[:game_id])
  end
end
