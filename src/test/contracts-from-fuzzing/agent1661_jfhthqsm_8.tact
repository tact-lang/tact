struct Person {
    name: String;
    age: Int;
    email: String?;
}

contract OptionalStruct {
    p: Person;

    init() {
        self.p = Person{name: "ivy", age: 23};
    }
}