struct Inner {
    a: Int;
}

struct Outer {
    b: Int;
    inr: Inner;
}

contract NestedOptionalStruct {
    s: Outer?;

    init() {
        self.s = null;
    }
}
