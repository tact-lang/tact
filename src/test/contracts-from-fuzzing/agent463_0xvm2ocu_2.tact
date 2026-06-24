struct OptionalInner {
    x: Int?;
    y: Bool?;
}

struct OptionalOuter {
    s: String?;
    inner: OptionalInner?;
}

contract OptionalFieldsTest {
    val: OptionalOuter;
    init() {
        self.val = OptionalOuter{
            s: null,
            inner: null
        };
    }
}
