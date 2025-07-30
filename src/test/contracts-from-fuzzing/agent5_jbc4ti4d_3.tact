struct OptionalStruct {
    name: String;
    age: Int?;
    description: String?;
}

contract WithOptionalStruct {
    user: OptionalStruct;

    init() {
        self.user = OptionalStruct{
            name: "Alice",
            age: null,
            description: null,
        };
    }
}