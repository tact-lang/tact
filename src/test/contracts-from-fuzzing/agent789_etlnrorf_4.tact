struct OptionalStruct {
    optField1: Int?;
    optField2: Bool?;
    optField3: String?;
}

contract OptionalNestedTest {
    data: OptionalStruct;
    init() {
        self.data = OptionalStruct{
            optField1: null,
            optField2: true,
            optField3: null
        };
    }
}