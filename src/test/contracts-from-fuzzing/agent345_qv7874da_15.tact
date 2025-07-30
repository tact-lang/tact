struct Person {
    name: String;
    age: Int;
}

struct Company {
    employee1: Person;
    employee2: Person;
}

contract OrgTest {
    company: Company;

    init() {
        self.company = Company{
            employee1: Person{ name: "Alice", age: 30 },
            employee2: Person{ name: "Bob", age: 40 }
        };
    }
}