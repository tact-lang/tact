struct Inner {
    x: Int;
}

struct Middle {
    inner: Inner;
}

contract FieldOrderTest {
    first: Int;
    mid: Middle;
    last: Int;

    init() {
        self.first = 11;
        self.mid = Middle{ inner: Inner{ x:42 } };
        self.last = 77;
    }
}