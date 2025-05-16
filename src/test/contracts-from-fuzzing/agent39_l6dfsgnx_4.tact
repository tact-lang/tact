struct Inner {
    value: Int;
}

struct Outer {
    inner: Inner;
}

contract Test {
    receive() {
        let data: Outer = Outer{inner: Inner{value: 10}};
    }
}