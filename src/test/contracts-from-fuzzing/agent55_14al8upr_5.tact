struct Inner {
    a: Int;
    b: Int;
}

struct Outer {
    inner: Inner;
    c: Int;
}

contract TestNested {
    init() {
        let inst = Outer {
            inner: Inner { a: 10, b: 20 },
            c: 30
        };
    }
}
