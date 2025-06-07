struct OptionalFieldsStruct {
    fieldA: Int?;
    fieldB: Bool?;
    fieldC: Address?;
    fieldD: String?;
}

contract OptionalFieldsTest {
    optField: OptionalFieldsStruct;
    init() {
        self.optField = OptionalFieldsStruct{
            fieldA: null,
            fieldB: true,
            fieldC: null,
            fieldD: "hello",
        };
    }
}