struct OptionalStruct {
    foo: Int;
}

contract OptionalFieldTest {
    opt: OptionalStruct?;

    init() {
        self.opt = null;
    }
}
