struct OptStruct {
    x: Int;
    y: Bool;
}

contract OptionalStructFieldTest {
    opt: OptStruct?;

    init() {
        self.opt = null;
    }
}