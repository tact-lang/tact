struct OptionalStruct {
    optVal: Int?;
    flag: Bool;
}

contract OptionalFieldsTest {
    stored: OptionalStruct;

    init() {
        self.stored = OptionalStruct{
            optVal: null,
            flag: false
        };
    }
}
