struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
}

contract DeepGetter {
    d: Outer;

    init() {
        self.d = Outer { inner: Inner { a: 99 } };
    }

    receive() {}

    // Getter returning a deeply nested composite structure
    get fun getDeep() : Outer {
        return self.d;
    }
}
