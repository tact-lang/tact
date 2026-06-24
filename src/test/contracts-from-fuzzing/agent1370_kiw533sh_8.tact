struct DeepOptionalInner {
    val: Int;
}

struct DeepOptionalOuter {
    inner: DeepOptionalInner?;
}

contract DeepOptionalNestTest {
    outer: DeepOptionalOuter;

    init() {
        self.outer = DeepOptionalOuter{
            inner: null
        };
    }
}