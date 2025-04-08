struct Person {
    name: String;
    age: Int?;
    email: String?;
}

contract DefaultOmit {
    p: Person;

    init() {
        self.p = Person{
            name: "Bob" // omit optional fields, default null implicit
        };
    }
}