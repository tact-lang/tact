struct Nested {
    inner: Data;
}

struct Data {
    value: Int;
}

contract Test {
    receive() {
        let n = Nested { inner: Data { value: 1 } };
        let v = n.inner.value;
    }
}