struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    inner: Inner;
    z: Int;
}

contract DeepNestedGetter {
    st: Outer;

    init() {
        self.st = Outer {
            inner: Inner { x: 7, y: false },
            z: 100
        };
    }

    // Getter returning a deeply nested composite type
    get fun getOuter(): Outer {
        return self.st;
    }

    receive() {}
}
