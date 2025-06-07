struct InnerMost {
    a: Int;
    b: Bool;
}

struct Inner {
    im: InnerMost;
    c: String?;
}

contract Test {
    nested: Inner;

    init() {
        self.nested = Inner{ im: InnerMost{ a: 1, b: false }, c: "hi" };
    }
}