struct OptionalStruct {
    foo: Int;
}

contract OptFieldTest {
    optField: OptionalStruct?;

    init() {
        self.optField = null;
    }
}
