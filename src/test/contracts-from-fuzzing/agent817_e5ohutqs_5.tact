struct OptStruct {
    foo: Int;
    bar: Bool;
}

contract Test {
    maybe: OptStruct?;

    init() {
        self.maybe = null;
    }
}