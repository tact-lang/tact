struct OptionalStruct {
    info: String;
    number: Int;
}

contract OptionalFieldTest {
    maybeData: OptionalStruct?;

    init() {
        self.maybeData = null;
    }
}