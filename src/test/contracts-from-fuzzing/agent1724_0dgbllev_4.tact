struct OptStruct {
    foo: Int;
    bar: Bool;
}

contract OptTest {
    s: OptStruct?;
    active: Bool;

    init() {
        self.s = null;
        self.active = true;
    }
}