struct OptionalStruct {
    foo: Int;
    bar: Bool;
}

contract OptionalsTest {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}