struct OptionalStruct {
    field1: Int;
    field2: Int?;
    field3: Bool?;
}

contract OptionalTest {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{
            field1: 1,
            field2: null,
            field3: true
        };
    }
}