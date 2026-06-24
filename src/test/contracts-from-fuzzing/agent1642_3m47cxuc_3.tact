struct Point { x: Int; y: Int; }

struct Person {
    name: String;
    age: Int?;
    location: Point?;
}

contract MixedOptionalNested {
    person: Person;

    init() {
        self.person = Person{
            name: "Test",
            age: null,
            location: null
        };
    }
}