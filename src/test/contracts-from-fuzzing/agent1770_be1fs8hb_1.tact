struct Person {
    name: String;
    age: Int;
    is_active: Bool;
}

contract TestContract {
    p: Person;

    init() {
        self.p = Person{
            name: "Alice",
            age: 30,
            is_active: true,
        };
    }
}