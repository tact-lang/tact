struct Inner {
    a: Int;
}

struct Middle {
    x: Int;
    inner: Inner?;
}

contract MiddleOptionalNested {
    mid: Middle;

    init() {
        self.mid = Middle{ x: 5, inner: null };
    }
}