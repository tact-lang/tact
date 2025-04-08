struct Person {
    name: String;
    age: Int;
}

contract Test {
    person: Person?;  

    init() {
        self.person = Person{
            name: "Alice",
            age: 30,
        };
    }

    receive() {}
}