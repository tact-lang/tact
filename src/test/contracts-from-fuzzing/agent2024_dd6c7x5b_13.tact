struct InnerMost {
    x: Int;
    y: Bool;
}

struct Inner {
    nested: InnerMost;
    s: String;
}

contract NestedStructWithPrimitives {
    data: Inner;

    init() {
        self.data = Inner{
            nested: InnerMost{
                x: 1,
                y: true
            },
            s: "hi"
        };
    }
}