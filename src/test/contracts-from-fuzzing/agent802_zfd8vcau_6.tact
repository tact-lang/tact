struct OptionalStruct {
    a: Int;
    b: Bool;
}

contract OptionalInContract {
    foo: OptionalStruct?;

    init() {
        self.foo = null;
    }
}