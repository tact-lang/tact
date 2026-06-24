struct Person {
    name: String;
    age: Int as uint8;
    active: Bool;
}

contract TestContract {
    p: Person;

    init() {
        self.p = Person{ name: "Jon", age: 30, active: true };
    }
}