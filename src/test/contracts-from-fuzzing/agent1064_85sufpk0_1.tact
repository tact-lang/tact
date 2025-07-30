struct DeepNested {
    a: Int;
    b: Inner;
}

struct Inner {
    x: Int;
    y: InnerMost?;
}

struct InnerMost {
    p: Int;
    q: String;
}

contract Test {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            a: 1,
            b: Inner{
                x: 2,
                y: InnerMost{
                    p: 3,
                    q: "abc",
                },
            },
        };
    }
}