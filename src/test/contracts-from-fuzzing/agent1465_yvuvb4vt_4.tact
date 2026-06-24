struct OptionalNested {
    name: String?;
    age: Int?;
}

contract TestContract {
    person: OptionalNested;

    init() {
        self.person = OptionalNested{name: null, age: null};
    }
}
