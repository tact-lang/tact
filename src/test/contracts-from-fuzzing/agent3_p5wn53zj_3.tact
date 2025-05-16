struct Inner {
    A: Int;
    B: Int;
}

struct Outer {
    Inner: Inner;
    X: Int;
}

contract TestNested {
    receive() {
        let o = Outer {
            Inner: Inner { A: 1, B: 2 },
            X: 10
        };
        o.Inner.A + o.Inner.B + o.X;
    }
}
