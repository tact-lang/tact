struct Person {
    name: String;
    age: Int?;
    alive: Bool = true;
}

contract OptionalDefaults {
    person: Person;
    
    init() {
        self.person = Person{name:"Alex", age:null};
    }
}