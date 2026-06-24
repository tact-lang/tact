struct Inner {
    a: Int;
    b: Int?;
}

struct Outer {
    inner: Inner;
}

contract DeepNestedGetter {
    d: Outer;

    init() {
        self.d = Outer{ inner: Inner{ a: 55, b: null } };
    }

    receive() {}

    // Getter returns a deeply nested composite type
    get fun get_outer(): Outer {
        return self.d;
    }
}
