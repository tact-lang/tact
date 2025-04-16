struct Person {
    name: String;
    age: Int?;
    verified: Bool;
}

struct Company {
    ceo: Person;
    contact: Person?;
}

contract TestContract {
    partner: Company;

    init() {
        self.partner = Company{
            ceo: Person{name:"Alice", age:30, verified:true},
            contact: null
        };
    }
}