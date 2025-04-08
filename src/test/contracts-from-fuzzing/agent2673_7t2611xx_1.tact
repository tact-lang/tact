struct Nested {
    inner: Inner;
}

struct Inner {
    x: Int;
    y: Int;
}

contract DeepStructTest {
    data: Nested;

    init() {
        self.data = Nested{ inner: Inner{ x: 1, y: 2 } };
    }
}