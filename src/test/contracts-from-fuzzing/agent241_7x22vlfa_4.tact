struct OptStruct {
    name: String;
    age: Int?;
    description: String?;
}

contract OptionalFieldsContract {
    metadata: OptStruct;

    init() {
        self.metadata = OptStruct{
            name: "test",
            age: null,
            description: null
        };
    }
}