struct Person {
    name: String;
    age: Int?;
    address: Address;
}

contract ComplexPeople {
    p1: Person;
    p2: Person;
    init() {
        self.p1 = Person{name:"A", age:null, address:myAddress()};
        self.p2 = Person{name:"B", age:30, address:myAddress()};
    }
}