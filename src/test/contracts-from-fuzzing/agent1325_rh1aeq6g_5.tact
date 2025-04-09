struct OptionalInner {
    val: Int?;
}

struct OptionalMiddle {
    inner: OptionalInner?;
}

contract OptionalNestTest {
    state: OptionalMiddle;

    init() {
        self.state = OptionalMiddle{ inner: OptionalInner{ val: 42 } };
    }
}