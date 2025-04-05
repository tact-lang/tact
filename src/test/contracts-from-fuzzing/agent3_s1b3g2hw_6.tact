struct Inner {
    value: Int;
}

struct Outer {
    inner: Inner;
}

contract Test {
    receive() {
        let o: Outer = Outer{inner: Inner{value: 10}};
    }
}