struct OptionalStringStruct {
    str: String?;
    num: Int;
}

contract OptStringStructTest {
    field: OptionalStringStruct;
    init() {
        self.field = OptionalStringStruct {
            str: null,
            num: 42,
        };
    }
}