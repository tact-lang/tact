struct Nested {
    inner: Inner;
}

struct Inner {
    value: Int;
}

contract Test {
    data: Nested;
    init() {
        self.data = Nested{inner: Inner{value: 5}};
    }
}