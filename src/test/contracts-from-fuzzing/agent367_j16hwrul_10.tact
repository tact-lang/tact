struct OptionalStruct {
    x: Int;
    y: Bool;
}

contract OptFieldTest {
    data: OptionalStruct?;
    init() {
        self.data = null;
    }
}