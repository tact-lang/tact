struct Inner {
    x: Int;
}

struct Outer {
    nested: Inner;
    a: Int;
}

contract TestNested {
    receive() {
        let o: Outer = Outer { nested: Inner { x: 42 }, a: 100 };
    }
}
