struct Inner {
    val: Int;
}

struct Middle {
    inner: Inner?;
}

struct Outer {
    middle: Middle?;
}

contract TestContract {
    nestedOpt: Outer;

    init() {
        self.nestedOpt = Outer{ middle: null };
    }
}
