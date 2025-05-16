struct Inner {
    a: Int;
}

struct Outer {
    b: Inner?;
}

contract NullStructInit {
    store: Outer;

    init() {
        self.store = Outer{ b: null };
    }
}
