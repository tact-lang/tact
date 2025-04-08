struct Nested {
    inner: Inner;
}

struct Inner {
    flag: Bool;
    text: String;
}

contract DeepNestedTest {
    data: Nested;

    init() {
        self.data = Nested{ inner: Inner{ flag: true, text: "Hello" } };
    }
}