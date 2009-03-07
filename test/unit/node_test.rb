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

require 'test_helper'

class NodeTest < Test::Unit::TestCase
  should_belong_to :map
  should_belong_to :player

  context "With position [3, 10]" do
    setup { @node = Node.new(:position => [3, 10]) }

    should "return correct hex positions" do
      assert_equal [[2, 5], [2, 4], [3, 4]], @node.hex_positions
    end

    should "return correct edge positions" do
      assert_equal [[2, 18], [3, 16], [3, 17]], @node.edge_positions
    end

    should "return correct node positions" do
      assert_equal [[2, 11], [3, 9], [3, 11]], @node.node_positions
    end
  end

  context "With position [6, 7]" do
    setup { @node = Node.new(:position => [6, 7]) }

    should "return correct hex positions" do
      assert_equal [[5, 3], [6, 2], [6, 3]], @node.hex_positions
    end

    should "return correct edge positions" do
      assert_equal [[6, 13], [6, 11], [6, 12]], @node.edge_positions
    end

    should "return correct node positions" do
      assert_equal [[6, 8], [6, 6], [7, 6]], @node.node_positions
    end
  end
end
