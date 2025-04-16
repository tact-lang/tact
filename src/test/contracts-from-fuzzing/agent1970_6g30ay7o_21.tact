struct Person {
    name: String;
    age: Int;
}

struct Employee {
    person: Person;
    title: String;
    salary: Int;
}

contract Company {
    employee: Employee;

    init() {
        self.employee = Employee{
            person: Person{
                name: "John",
                age: 30
            },
            title: "CTO",
            salary: 1000000
        };
    }
}