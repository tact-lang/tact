struct Outer {
    inner: Inner;
}

struct Inner {
    num: Int;
}

contract Test {
    receive() {
        let o = Outer{ inner: Inner{ num: 5 } };
    }
}