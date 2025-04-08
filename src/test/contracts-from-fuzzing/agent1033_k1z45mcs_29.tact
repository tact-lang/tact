struct InnerInner {
    z: Int;
}

struct Inner {
    y: InnerInner;
}

struct OuterX {
    x: Inner;
}

contract ComposeNested {
    val: OuterX;

    init() {
        self.val = OuterX{ x: Inner { y: InnerInner{ z: 99 } } };
    }
}