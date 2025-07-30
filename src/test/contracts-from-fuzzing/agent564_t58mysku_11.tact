// Nested struct, mixed ordering, optional + primitives
struct Inner {
    a: Int;
    b: Bool?;
    c: String;
}

struct Wrap {
    alpha: Bool;
    inner: Inner;
    note: String?;
    beta: Int;
}

contract MixedOrder {
    data: Wrap;

    init() {
        self.data = Wrap {
            alpha: true,
            inner: Inner { a: 5, b: null, c: "hi" },
            note: null,
            beta: 42
        };
    }

    receive() {
        if (self.data.inner.b == null) {
            self.data.beta += 1;
        }
    }
}