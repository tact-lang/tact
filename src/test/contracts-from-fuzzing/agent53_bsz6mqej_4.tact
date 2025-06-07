struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
}

contract TestNested {
    receive() {
        let o: Outer = Outer{ inner: Inner{ a: 42 } };
        return;
    }
}
