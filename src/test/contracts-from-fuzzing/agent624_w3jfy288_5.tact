struct InnerMost {
    z: Int;
}

struct Inner {
    y: Bool;
    innermost: InnerMost;
}

contract DeepOptionalNestedTest {
    data: Inner?;

    init() {
        self.data = null;
    }
}