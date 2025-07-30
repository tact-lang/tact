struct OptionalNested {
    field1: Int?;
    field2: Bool?;
    field3: String?;
}

contract OptionalStorage {
    optStruct: OptionalNested;

    init() {
        self.optStruct = OptionalNested{field1: null, field2: true, field3: "test"};
    }
}
