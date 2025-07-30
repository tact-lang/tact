struct OptionalStruct {
    x: Int;
}

contract OptionalStructFieldTest {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}