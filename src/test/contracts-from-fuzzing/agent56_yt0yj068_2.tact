struct Inner {
    deepVal: Int;
}

struct Middle {
    inner: Inner;
}

contract Test {
    middle: Middle;

    init() {
        self.middle = Middle{ inner: Inner{ deepVal: 7 } };
    }
}