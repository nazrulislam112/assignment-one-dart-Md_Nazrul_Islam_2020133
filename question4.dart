import 'dart:core';

abstract class Vehicle {
  String brand;
  String model;
  int year;

  Vehicle(this.brand, this.model, this.year);

  void start();

  void stop();

  void displayInfo() {
    print('Vehicle Info: $year $brand $model');
  }

  int calculateAge() {
    return 2024 - year;
  }
}

class Car extends Vehicle {
  int numberOfDoors;

  Car(String brand, String model, int year, this.numberOfDoors)
      : super(brand, model, year);

  @override
  void displayInfo() {
    print('Vehicle Info: $year $brand $model ($numberOfDoors doors)');
  }

  @override
  void start() {
    print('Starting the car engine...');
  }

  @override
  void stop() {
    print('Stopping the car engine...');
  }
}

class Motorcycle extends Vehicle {
  bool hasWindshield;

  Motorcycle(String brand, String model, int year, this.hasWindshield)
      : super(brand, model, year);

  @override
  void displayInfo() {
    print('Vehicle Info: $year $brand $model (Has windshield: $hasWindshield)');
  }

  @override
  void start() {
    print('Starting the motorcycle engine...');
  }

  @override
  void stop() {
    print('Stopping the motorcycle engine...');
  }
}

void main() {
  List<Vehicle> vehicles = [
    Car('Toyota', 'Camry', 2020, 4),
    Motorcycle('Honda', 'CBR', 2021, true),
  ];

  for (var vehicle in vehicles) {
    vehicle.displayInfo();
    vehicle.start();
    vehicle.stop();
    print('');
  }

  print('Car age: ${vehicles[0].calculateAge()} years');
  print('Motorcycle age: ${vehicles[1].calculateAge()} years');
}