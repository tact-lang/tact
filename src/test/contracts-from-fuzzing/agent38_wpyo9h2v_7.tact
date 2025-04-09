struct Inner {
    i: Int;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract Test_DeepGetter {
    o: Outer = Outer { inner: Inner { i: 100 }, flag: true };

    receive() {}

    // Getter function returning a deeply nested composite type
    get fun getOuter(): Outer {
        return self.o;
    }
}
