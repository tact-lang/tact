struct Person { name: String; age: Int?; alive: Bool; }

struct Company {
    founder: Person;
    ceo: Person?;
    name: String;
    employees: Int;
}

contract Org {
    data: Company;

    init() {
        self.data = Company{
            founder: Person{ name: "A", age: 50, alive: true },
            ceo: null,
            name: "TestCorp",
            employees: 100,
        };
    }
}