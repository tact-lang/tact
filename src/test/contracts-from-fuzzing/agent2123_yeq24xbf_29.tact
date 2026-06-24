struct Person {
    name: String;
    age: Int;
}

struct Company {
    founder: Person;
    ceo: Person;
}

contract NestedPeople {
    company: Company;

    init() {
        self.company = Company{
            founder: Person{ name:"Alice", age:30 },
            ceo: Person{ name:"Bob", age:40 },
        };
    }
}