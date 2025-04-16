struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner;
    y: Int;
}

contract TestContract2 {
    receive() {
        let o: Outer = Outer{ inner: Inner{ x: 100 }, y: 200 };
    }
}
