struct Person {
    name: String;
    age: Int;
    alive: Bool;
}

struct Company {
    ceo: Person;
    founder: Person;
    employeeCount: Int;
    startedYear: Int;
    bankrupt: Bool;
}

contract NestedMultipleStructs {
    data: Company;

    init() {
        self.data = Company{
            ceo: Person{name:"Alice", age:50, alive:true},
            founder: Person{name:"Bob", age:80, alive:false},
            employeeCount: 1000,
            startedYear: 1990,
            bankrupt: false
        };
    }
}
