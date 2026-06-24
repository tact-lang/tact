struct Inner {
    x: Int;
}

struct Middle {
    val: Inner?;
}

contract OptionalInnerNested {
    m: Middle;

    init() {
        self.m = Middle{ val: null };
    }
}