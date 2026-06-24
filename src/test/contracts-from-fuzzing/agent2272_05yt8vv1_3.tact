struct OptStruct {
    a: Int;
    b: Bool;
}

contract OptFieldTest {
    field: OptStruct?;

    init() {
        self.field = null;
    }
}