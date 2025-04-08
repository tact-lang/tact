struct Inner {
    i: Int;
}

struct Outer {
    inner: Inner?;
}

contract OuterInnerAssigned {
    s: Outer;

    init() {
        self.s = Outer{ inner: Inner{ i: 77 } };
    }
}