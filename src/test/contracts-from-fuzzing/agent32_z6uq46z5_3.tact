struct OptionalStruct {
    v1: Int?;
    v2: Bool?;
    v3: String?;
}

contract OptionalFieldsTest {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            v1: null, v2: null, v3: null,
        };
    }
}
