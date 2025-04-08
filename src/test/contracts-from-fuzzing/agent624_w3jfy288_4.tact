struct InnerMost {
    z: Int;
}

struct Inner {
    y: Bool;
    innermost: InnerMost;
}

contract DeepNestedTest {
    data: Inner;

    init() {
        self.data = Inner{
            y: true,
            innermost: InnerMost{ z: 999 }
        };
    }
}