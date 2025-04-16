struct OptionalStruct {
    foo: Int;
    bar: Bool;
}

contract OptionalFieldsTest {
    maybeData: OptionalStruct?;
    init() {
        self.maybeData = null;
    }
}