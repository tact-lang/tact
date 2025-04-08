struct InnerMost {
    x: Int;
    y: Int?;
}

struct Inner {
    nested: InnerMost;
    flag: Bool;
}

contract DeepNestedTest {
    data: Inner;

    init() {
        self.data = Inner{
            nested: InnerMost{
                x: 1,
                y: null,
            },
            flag: true,
        };
    }
}