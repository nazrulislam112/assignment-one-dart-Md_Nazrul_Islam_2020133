import 'dart:core';

mixin Payable {
  double calculateSalary(double baseSalary, double bonus) {
    return baseSalary + bonus;
  }

  void processPayment(double amount) {
    print('Payment processed: ${amount.toStringAsFixed(1)}');
  }
}

mixin Reportable {
  String generateReport(String employeeName, String department) {
    return 'Report: Monthly report for $employeeName in $department department';
  }
}

abstract class Employee {
  String name;
  String id;
  String department;

  Employee(this.name, this.id, this.department);

  String getJobTitle();

  double getBaseSalary();

  void displayInfo() {
    print('${getJobTitle()}: $name (ID: $id, Department: $department)');
    print('Job Title: ${getJobTitle()}');
    print('Base Salary: ${getBaseSalary().toStringAsFixed(1)}');
  }
}

class Manager extends Employee with Payable, Reportable {
  int teamSize;

  Manager(String name, String id, String department, this.teamSize)
      : super(name, id, department);

  @override
  String getJobTitle() => 'Manager';

  @override
  double getBaseSalary() => 8000.0;
}

class Developer extends Employee with Payable {
  String programmingLanguage;

  Developer(String name, String id, String department, this.programmingLanguage)
      : super(name, id, department);

  @override
  String getJobTitle() => 'Senior Developer';

  @override
  double getBaseSalary() => 6000.0;
}

void main() {
  Manager manager = Manager('John Smith', 'M001', 'IT', 5);
  Developer developer = Developer('Alice Johnson', 'D001', 'IT', 'Dart');

  List<Employee> employees = [manager, developer];

  for (var employee in employees) {
    employee.displayInfo();

    double base = employee.getBaseSalary();
    double bonus = employee is Manager ? 1000.0 : 500.0;

    if (employee is Payable) {
      // The `employee` variable is of type `Employee`. Even though it's checked
      // with `is Payable`, some Dart analysis setups might require an explicit
      // cast to access mixin methods if type promotion isn't fully applied.
      double calculatedSalary = (employee as Payable).calculateSalary(base, bonus);
      print('Calculated Salary: ${calculatedSalary.toStringAsFixed(1)}');
      (employee as Payable).processPayment(calculatedSalary);
    }

    if (employee is Reportable) {
      // Apply explicit cast for Reportable mixin methods as well for consistency
      // and to prevent similar errors.
      print((employee as Reportable).generateReport(employee.name, employee.department));
    }
    print('');
  }
}