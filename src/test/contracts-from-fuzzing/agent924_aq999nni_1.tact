struct InnerMost {
    z: Int?;
}

struct Inner {
    y: Int;
    innerMost: InnerMost;
}

struct Outer {
    x: Int;
    optionalInner: Inner?;
}

contract DeepNestedTest {
    val: Outer;

    init() {
        self.val = Outer{
            x: 1,
            optionalInner: null,
        };
    }
}