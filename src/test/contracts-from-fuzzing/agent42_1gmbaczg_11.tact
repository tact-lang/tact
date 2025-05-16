struct Inner {
    value: Int;
}

struct Outer {
    inner: Inner;
    note: String;
}

contract TestNested {
    s: Outer = Outer{ inner: Inner{ value: 99 }, note: "Hello" };

    receive() {}

    // Getter returning a nested struct
    get fun getOuter(): Outer {
        return self.s;
    }
}
