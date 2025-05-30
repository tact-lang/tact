struct OptionalStruct {
    foo: Bool;
}

contract OptionalStructFieldTest {
    s: OptionalStruct?;
    init() {
        self.s = null;
    }
}