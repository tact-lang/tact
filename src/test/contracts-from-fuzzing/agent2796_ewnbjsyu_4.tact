struct OptionalInner {
    val: Int?;
    flag: Bool;
}

contract OptionalFieldTest {
    field: OptionalInner?;

    init() {
        self.field = null;
    }
}