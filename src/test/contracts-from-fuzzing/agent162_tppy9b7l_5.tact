struct OptionalStruct {
    name: String;
    age: Int?;
}

contract OptionalStructField {
    person: OptionalStruct;
    init() {
        self.person = OptionalStruct{
            name: "Alice",
            age: null,
        };
    }
}