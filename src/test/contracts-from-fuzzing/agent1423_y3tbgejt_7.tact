struct Inner {
    x: Int;
}

struct Outer {
    innerOpt: Inner?;
}

contract OptionalNested {
    s: Outer;
    init() {
        self.s = Outer{ innerOpt: null };
    }
}