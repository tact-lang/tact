struct Outer {
    optInner: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalNest {
    data: Outer;

    init() {
        self.data = Outer{ optInner: null };
    }
}