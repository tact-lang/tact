struct OptionalStruct {
    foo: Int;
    bar: Bool;
}

contract OptionalFieldTest {
    optField: OptionalStruct?;

    init() {
        self.optField = null;
    }
}