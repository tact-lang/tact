struct OptionalStruct {
    foo: Int;
}

contract OptStructTest {
    maybe: OptionalStruct?;

    init() {
        self.maybe = null;
    }
}