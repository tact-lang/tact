struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
}

contract TestContract {
    receive() {
        let o = Outer{ inner: Inner{ a: 5 } };
    }
}