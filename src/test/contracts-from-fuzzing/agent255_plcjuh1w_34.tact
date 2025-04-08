struct DoubleWrap {
    wr1: Inner?;
    wr2: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalDoubleWrapTest {
    f: DoubleWrap?;

    init() {
        self.f = null;
    }
}