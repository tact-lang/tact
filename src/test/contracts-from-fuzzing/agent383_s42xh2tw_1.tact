struct OptionalStruct {
    name: String;
    age: Int?;
}

contract WithOptional {
    optionalField: OptionalStruct;

    init() {
        self.optionalField = OptionalStruct{ name: "Alice", age: null };
    }
}
