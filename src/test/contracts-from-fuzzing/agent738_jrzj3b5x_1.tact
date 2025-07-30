struct InnerMost {
    a: Int;
    b: Bool;
}

struct Inner {
    x: InnerMost;
    y: Int?;
}

struct Top {
    foo: Inner;
    bar: Int;
}

contract DeepNestTest {
    data: Top;
    
    init() {
        self.data = Top{
            foo: Inner{
                x: InnerMost{a: 1, b: true},
                y: null,
            },
            bar: 42,
        };
    }
}
