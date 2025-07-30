struct OptionalStruct {
    flag: Bool;
}

contract OptionalStructFieldTest {
    maybe: OptionalStruct?;

    init() {
        self.maybe = null;
    }
}