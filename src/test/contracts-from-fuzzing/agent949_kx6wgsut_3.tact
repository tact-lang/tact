struct OptionalStruct {
    field1: Int?;
    field2: Bool?;
    field3: Address?;
    field4: Cell?;
}

contract OptionalFieldsTest {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            field1: null,
            field2: true,
            field3: null,
            field4: null,
        };
    }
}
