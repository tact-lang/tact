struct OptionalStruct {
    foo: Int;
    bar: Bool;
}

contract OptionalFieldTest {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}