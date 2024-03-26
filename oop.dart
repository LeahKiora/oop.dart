import 'dart:io';

// Interface for printable objects
abstract class Printable {
  void printInfo();
}

// Parent class
class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  void makeSound() {
    print("Generic animal sound");
  }

  void printInfo() {
    print("Name: $name, Age: $age");
  }
}

// Child class inheriting from Animal and implementing Printable interface
class Dog extends Animal implements Printable {
  String breed;

  Dog(String name, int age, this.breed) : super(name, age);

  @override
  void makeSound() {
    print("Woof!");
  }

  @override
  void printInfo() {
    super.printInfo();
    print("Breed: $breed");
  }
}

void main() {
  // Initialize instance from file
  var dog = readDogFromFile("dog_data.txt");
  dog.printInfo();
  dog.makeSound();

  // Demonstrate loop
  for (int i = 0; i < 3; i++) {
    print("Loop iteration $i");
  }
}

// Function to read dog data from file and create Dog instance
Dog readDogFromFile(String fileName) {
  var file = File(fileName);
  var lines = file.readAsLinesSync();

  var name = lines[0];
  var age = int.parse(lines[1]);
  var breed = lines[2];

  return Dog(name, age, breed);
}
