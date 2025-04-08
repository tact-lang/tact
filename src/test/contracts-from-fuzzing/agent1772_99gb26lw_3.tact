struct Deep {
    inner: NestedInner;
}

struct NestedInner {
    a: Bool;
    b: String;
}

contract Test3 {
    s: Deep;

    init() {
        self.s = Deep{
            inner: NestedInner{
                a: false,
                b: "deep",
            },
        };
    }
}