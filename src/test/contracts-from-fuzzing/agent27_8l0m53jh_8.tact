struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
}

contract Test5 {
    inner: Outer = Outer{ inner: Inner{ a: 99, b: false } };
    receive() {}

    // Getter returning a deeply nested composite type
    get fun getNested(): Outer {
        return self.inner;
    }
}
