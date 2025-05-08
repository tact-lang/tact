struct OptionalInner {
    val: Int?;
}

contract OptTest {
    data: OptionalInner;

    init() {
        self.data = OptionalInner{ val: null };
    }
}