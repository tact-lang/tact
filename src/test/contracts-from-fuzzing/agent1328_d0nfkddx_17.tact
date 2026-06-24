struct Person {
    name: String;
    age: Int;
}

struct Employee {
    person: Person;
    id: Int;
}

contract Company {
    e: Employee;
    init() {
        self.e = Employee{ person: Person{ name:"A", age:20 }, id: 1 };
    }
}