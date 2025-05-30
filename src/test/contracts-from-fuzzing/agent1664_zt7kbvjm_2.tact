struct Person {
    name: String;
    age: Int;
}

contract OptionalStructField {
    person: Person?;

    init() {
        self.person = null;
    }
}