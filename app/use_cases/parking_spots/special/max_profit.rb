module ParkingSpots
  module Special
    class MaxProfit
      attr_reader :incoming_cars

      CAPACITY = 50

      PRICING_TABLE = {
        "Dodge_15"    => { brand: "Dodge",    size: 15, price: 50  },
        "Jaguar_45"   => { brand: "Jaguar",   size: 45, price: 170 },
        "Mercedes_10" => { brand: "Mercedes", size: 10, price: 100 },
        "Audi_20"     => { brand: "Audi",     size: 20, price: 30  },
      }

      # NOTE: for testing only
      CARS = [
        { brand: "Dodge",    size: 15 },
        { brand: "Jaguar",   size: 45 },
        { brand: "Mercedes", size: 10 },
        { brand: "Audi",     size: 20 },
      ]

      def self.call(incoming_cars: CARS)
        new(incoming_cars).call
      end

      def initialize(incoming_cars)
        @incoming_cars = incoming_cars
      end

      def call
        cars = join_cars_with_prices(incoming_cars)
        find_most_profitable_cars(cars)
      end

      private

      def join_cars_with_prices(cars)
        cars.map do |car|
          search_index = "#{car[:brand]}_#{car[:size]}"
          car.merge(price: PRICING_TABLE[search_index][:price])
        end
      end

      def find_most_profitable_cars(cars)
        n = cars.size
        k = Array.new(n + 1) { Array.new(CAPACITY + 1) }

        (n + 1).times do |i|
          (CAPACITY + 1).times do |w|
            if i == 0 || w == 0
              k[i][w] = { profit: 0, cars: [] }

            elsif cars[i-1][:size] <= w
              prev_profit = k[i-1][w][:profit]
              current_profit = cars[i-1][:price] + k[i-1][w - cars[i-1][:size]][:profit]
              k[i][w] = if current_profit > prev_profit
                          {
                            profit: current_profit,
                            cars: [cars[i-1]] + k[i-1][w - cars[i-1][:size]][:cars]
                          }
                        else
                          k[i-1][w]
                        end

            else
              k[i][w] = k[i-1][w];
            end
          end
        end
        k[n][CAPACITY]
      end
    end
  end
end
