// Large nested optional struct chain including string & bool
struct D {
    s: String?;
}

struct C {
    inner: D?;
}

struct B {
    inner: C?;
}

struct A {
    inner: B?;
}

contract OptChain {
    root: A;

    init() {
        self.root = A{ inner: null };
    }
}