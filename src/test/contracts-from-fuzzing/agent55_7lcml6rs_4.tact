struct Outer {
    inner: Inner;
}

struct Inner {
    value: Int;
}

contract TestContract {
    receive() {
        let o = Outer{inner: Inner{value: 10}};
    }
}