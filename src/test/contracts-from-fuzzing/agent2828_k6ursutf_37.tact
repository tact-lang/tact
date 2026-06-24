struct Person {
    name: String;
    age: Int;
}

contract TrailingComma {
    p: Person;

    init() {
        self.p = Person{
            name: "Tom",
            age: 21,
        };
    }
}