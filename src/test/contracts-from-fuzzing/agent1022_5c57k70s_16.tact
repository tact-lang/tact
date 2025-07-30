struct Person {
    age: Int;
    name: String;
}

contract TestContract {
    p: Person?;

    init() {
        self.p = Person{
            age: 30,
            name: "Fuzz",
        };
    }

    receive() {}
}