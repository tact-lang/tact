struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner?;
}

contract Test6 {
    value: Outer;

    init() {
        self.value = Outer{ inner: null };
    }

    receive() {}

    get fun getOuter(): Outer {
        return self.value;
    }
}
