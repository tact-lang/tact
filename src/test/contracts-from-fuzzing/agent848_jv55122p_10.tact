struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner?;
}

struct OuterMost {
    outer: Outer?;
}

contract NestedOpts {
    big: OuterMost;

    init() {
        self.big = OuterMost{ outer: Outer{ inner: null } };
    }
}