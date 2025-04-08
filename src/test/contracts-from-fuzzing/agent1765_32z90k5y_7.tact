struct Person {
    age: Int;
    name: String;
}

contract OptionalStruct {
    person: Person?;

    init() {
        self.person = null;
    }
}