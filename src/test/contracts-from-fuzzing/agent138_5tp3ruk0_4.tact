struct OptionalStruct {
    val: Int;
    note: String;
}

contract OptionalFieldTest {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}