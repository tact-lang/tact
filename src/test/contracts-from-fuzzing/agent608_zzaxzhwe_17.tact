struct Person {
    name: String;
    age: Int;
}

struct Employee {
    person: Person;
    salary: Int;
    nickname: String?;
}

contract Company {
    ceo: Employee = Employee{person: Person{name:"Alice", age:50}, salary:1000, nickname:null};
    dev: Employee = Employee{person: Person{name:"Bob", age:30}, salary:500, nickname:"CoolDev"};
}
