struct Inner {
    z: Int;
}

struct Outer {
    optInner: Inner? = null;
}

contract TestContract {
    s: Outer = Outer{ optInner: null };

    init() {}
}