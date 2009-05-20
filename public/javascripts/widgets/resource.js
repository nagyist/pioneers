// Pioneers - web game based on the Settlers of Catan board game.

// Copyright (C) 2009 Jakub Kuźma <qoobaa@gmail.com>

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.

// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

$.widget("ui.resource", {
    _init: function() {
        this.element.addClass("ui-widget ui-resource");

        var that = this;

        $("<a/>").attr("href", "").addClass("ui-resource-minus").text("-").appendTo(this.element).click(function() {
            that._decrease();
            return false;
        });
        this.valueElement = $("<span/>").addClass("ui-resource-value").appendTo(this.element);
        $("<a/>").attr("href", "").addClass("ui-resource-plus").text("+").appendTo(this.element).click(function() {
            that._increase();
            return false;
        });

        this._refresh();
    },

    _refresh: function() {
        this.valueElement.removeClass("ui-resource-positive ui-resource-negative").text(Math.abs(this.options.value));
        if(this.options.value > 0) {
            this.valueElement.addClass("ui-resource-positive");
        } else if(this.options.value < 0) {
            this.valueElement.addClass("ui-resource-negative");
        }
    },

    _increase: function() {
        if(this.options.value < 0 && this.options.value + this.options.step <= this.options.max) {
            this.value(this.options.value + this.options.step);
        } else if (this.options.value >= 0 && this.options.value + 1 <= this.options.max){
            this.value(this.options.value + 1);
        }
    },

    _decrease: function() {
        if(this.options.value > 0 && this.options.value - 1 >= this.options.min) {
            this.value(this.options.value - 1);
        } else if(this.options.value <= 0 && this.options.value - this.options.step >= this.options.min) {
            this.value(this.options.value - this.options.step);
        }
    },

    value: function(value) {
        if(arguments.length) {
            this.options.value = value;
            this._trigger("change", null, [value]);
            this._refresh();
        }
        return this.options.value;
    },

    min: function(min) {
        if(arguments.length) {
            this.options.value = 0;
            this.options.min = min;
            this._refresh();
        }
        return this.options.min;
    },

    max: function(max) {
        if(arguments.length) {
            this.options.value = 0;
            this.options.max = max;
            this._refresh();
        }
        return this.options.max;
    },

    step: function(step) {
        if(arguments.length) {
            this.options.value = 0;
            this.options.step = step;
            this._refresh();
        }
        return this.options.step;
    }
});

$.extend($.ui.resource, {
    getter: "value min max step",
    defaults: {
        value: 0,
        step: 4,
        min: 0,
        max: 100
    }
});