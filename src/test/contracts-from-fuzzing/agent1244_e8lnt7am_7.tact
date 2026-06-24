struct OptionalStruct {
    x: Int;
}

contract OptionalFieldTest {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}
