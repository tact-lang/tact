struct InnerInner {
    a: Int;
    b: Bool?;
}

struct Inner {
    c: InnerInner;
    d: Int?;
}

contract Deeply {
    val: Inner;
    init() {
        self.val = Inner {
            c: InnerInner { a: 5, b: null },
            d: 42
        };
    }
}