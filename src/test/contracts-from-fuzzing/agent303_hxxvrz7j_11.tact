struct OneOptionalInner {
    num: Int?;
}

struct OneOptionalOuter {
    wrapped: OneOptionalInner?;
    fixed: Int;
}

contract DoubleOptionalStructTest {
    data: OneOptionalOuter;

    init() {
        self.data = OneOptionalOuter{
            wrapped: null,
            fixed: 123,
        };
    }
}