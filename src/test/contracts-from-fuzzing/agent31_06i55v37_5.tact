struct Inner {
    A: Int;
}

struct Outer {
    InnerField: Inner;
}

contract Test {
    receive() {
        let obj: Outer = Outer { InnerField: Inner { A: 99 } };
        dump(obj.InnerField.A);
    }
}
