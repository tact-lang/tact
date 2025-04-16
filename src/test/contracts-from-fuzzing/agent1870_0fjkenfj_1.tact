struct OptionalStruct {
    name: String;
    age: Int?;
}

contract OptStructStorage {
    person: OptionalStruct;

    init() {
        self.person = OptionalStruct{ name: "Alice", age: null };
    }
}
