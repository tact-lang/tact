struct OptStruct {
    foo: Int;
    bar: Int?;
}

contract OptionalStruct {
    s: OptStruct?;

    init() {
        self.s = null;
    }
}