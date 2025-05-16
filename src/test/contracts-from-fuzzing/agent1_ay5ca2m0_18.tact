struct OptionalStruct {
    a: Int;
    b: Bool;
}

contract OptionalStructFieldTest {
    s: OptionalStruct?;

    init() {
        self.s = null;
    }
}
