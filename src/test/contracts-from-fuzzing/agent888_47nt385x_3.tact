struct Person {
    name: String;
    age: Int;
}

struct Employee {
    person: Person?;
    salary: Int;
}

contract TestContract {
    info: Employee;

    init() {
        self.info = Employee{person: null, salary: 1000};
    }
}