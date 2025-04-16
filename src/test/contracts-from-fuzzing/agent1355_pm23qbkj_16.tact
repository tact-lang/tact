struct Person {
    name: String;
    age: Int;
    alive: Bool;
}

struct Company {
    ceo: Person;
    name: String;
    active: Bool;
}

contract MultiNest {
    data: Company;
    init() {
        self.data = Company{
            ceo: Person{
                name: "Alice",
                age: 36,
                alive: true
            },
            name: "Acme",
            active: false
        };
    }
}