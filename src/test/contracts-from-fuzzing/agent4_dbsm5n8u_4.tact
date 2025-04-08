struct Nested {
    n: Int?;
    inner: Inner;
}

struct Inner {
    val: Int;
    text: String;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            n: null,
            inner: Inner{ val: 42, text: "hello" }
        };
    }
}