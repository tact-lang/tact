struct Inner {
    a: Int;
}

struct Mid {
    inner: Inner;
}

struct Outer {
    mid: Mid;
}

contract MultiNest {
    val: Outer;

    init() {
        self.val = Outer{mid: Mid{inner: Inner{a:42}}};
    }
}