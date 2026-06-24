struct Inner {
    x: Int;
    y: Int;
}

struct Middle {
    a: Inner;
    b: Int;
}

contract NestedFields {
    m: Middle;

    init() {
        self.m = Middle { a: Inner { x: 1, y: 2 }, b: 3 };
    }
}