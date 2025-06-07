struct Nested {
    b1: Bool;
    inner: Inner;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{b1: true, inner: Inner{x: 10, y: false}};
    }
}
