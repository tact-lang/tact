struct OptionalNested {
    name: String?;
    age: Int?;
}

contract OptionalStructStorage {
    profile: OptionalNested;

    init() {
        self.profile = OptionalNested{name: null, age: null};
    }
}