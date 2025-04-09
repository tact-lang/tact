struct Inner {
    x: Int
}

struct Outer {
    inner: Inner
}

contract Test {
    receive() {
        let s = Inner{ x: 5 };
        let o = Outer{ inner: s };
        o;
    }
}