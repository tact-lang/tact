struct OptionalStruct {
    foo: Int;
    bar: Int;
}

contract Test {
    opt_s: OptionalStruct?;

    init() {
        self.opt_s = null;
    }
}