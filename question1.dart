String name = "John Doe";
int age = 25;
double heightDisplay = 5.9;
bool isStudent = true;

double calculateBMI(double weight, double height) {
    if (height <= 0) {
        return 0.0;
    }

  double bmi = weight / (height * height);
    return double.parse(bmi.toStringAsFixed(1));
}

String getGrade(int score) {
    if (score >= 90) {
        return "A";
    } else if (score >= 80) {
        return "B";
    } else if (score >= 70) {
        return "C";
    } else if (score >= 60) {
        return "D";
    } else {
        return "F";
    }
}

void main(){

    print("Name: $name, Age: $age, Height: $heightDisplay, Is Student: $isStudent");

    double exampleWeight = 70.0;
    double exampleHeight = 1.75;
    double bmi = calculateBMI(exampleWeight, exampleHeight);

    int exampleScore = 85;
    String grade = getGrade(exampleScore);

    print('BMI: $bmi');
    print('Grade: $grade');
}