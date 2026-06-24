struct Inner {
    x: Int = 1;
    y: Bool = true;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract ChainNestedOptional {
    opt_outer: Outer?;
    init() {
        self.opt_outer = null;
    }
}