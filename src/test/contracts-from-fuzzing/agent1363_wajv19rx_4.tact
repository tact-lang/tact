struct InnerMost {
    a: Int;
    b: Bool?;
}

struct Inner {
    x: InnerMost;
    y: String;
}

struct Outer {
    m: Inner;
    n: Int;
}

contract NestedContract {
    val: Outer;

    init() {
        self.val = Outer{
            m: Inner{
                x: InnerMost{ a: 7, b: true },
                y: "hi",
            },
            n: 42,
        };
    }
}