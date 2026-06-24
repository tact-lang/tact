struct OptionalInner {
    val: Int?;
    flag: Bool;
}

contract OptionalOuterTest {
    data: OptionalInner?;

    init() {
        self.data = null;
    }
}