struct Inner {
    F: Int;
}

struct Outer {
    InnerField: Inner;
    X: Int;
}

contract TestNested {
    receive() {
        let o: Outer = Outer { InnerField: Inner { F: 42 }, X: 99 };
        o.InnerField.F;
    }
}
