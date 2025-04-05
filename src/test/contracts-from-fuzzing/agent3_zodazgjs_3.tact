struct Inner {
    i1: Int;
    i2: Int;
    i3: Int;
}

struct Outer {
    a: Inner;
    b: Int;
    c: Inner;
}

contract TestNestedStruct {
    receive() {
        let o = Outer {
            a: Inner { i1: 1, i2: 2, i3: 3 },
            b: 42,
            c: Inner { i1: 4, i2: 5, i3: 6 },
        };
        o.a.i2;
    }
}
