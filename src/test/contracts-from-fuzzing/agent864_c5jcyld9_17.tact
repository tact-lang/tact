struct Person {
    name: String;
    age: Int;
}

contract TestContract {
    p: Person?;

    init() {
        self.p = Person{
            name: "Mike",
            age: 33
        };
    }
}