struct OptionalStruct {
    s: String;
}

contract OptionalStructTest {
    field: OptionalStruct?;

    init() {
        self.field = null;
    }
}