struct Inner {
    num: Int;
    flag: Bool;
}

struct Outer {
    optInner: Inner?;
}

contract OptionalEmbedTest {
    val: Outer;

    init() {
        self.val = Outer{ optInner: null };
    }
}
