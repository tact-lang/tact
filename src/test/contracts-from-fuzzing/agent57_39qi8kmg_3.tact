struct InnerMost {
    val: Int;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    middle: Middle;
}

contract MultiLayer {
    val: Outer;

    init() {
        self.val = Outer{ middle: Middle{ inner: InnerMost{ val: 123 } } };
    }
}