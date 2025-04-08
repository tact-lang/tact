struct NestedDepth {
    inner: InnerLevel;
}

struct InnerLevel {
    optInner: InnerMost?;
}

struct InnerMost {
    x: Int;
}

contract DeepNestTest {
    val: NestedDepth;

    init() {
        self.val = NestedDepth{
            inner: InnerLevel{
                optInner: InnerMost{ x: 42 }
            }
        };
    }
}