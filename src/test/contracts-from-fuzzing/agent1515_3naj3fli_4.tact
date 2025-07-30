struct OptStruct {
    number: Int;
    flag: Bool;
}

contract OptionalFieldTest {
    maybe: OptStruct?;

    init() {
        self.maybe = null;
    }
}