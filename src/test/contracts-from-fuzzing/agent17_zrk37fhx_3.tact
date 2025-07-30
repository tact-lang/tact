struct OptionalStruct {
    value: Int;
}

contract OptionalFieldTest {
    opt: OptionalStruct?;

    init() {
        self.opt = null;
    }
}