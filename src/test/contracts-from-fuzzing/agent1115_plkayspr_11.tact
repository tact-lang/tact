struct OptionalStruct {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeString: String?;
}

contract OptionalFieldsTest {
    data: OptionalStruct;
    init() {
        self.data = OptionalStruct {
            maybeInt: null,
            maybeBool: true,
            maybeString: "present"
        };
    }
}
