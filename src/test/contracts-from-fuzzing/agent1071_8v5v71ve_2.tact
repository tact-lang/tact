struct Nested {
    inner: Inner;
    flag: Bool = true;
}

struct Inner {
    num: Int = 1;
    text: String = "hi";
}

contract Test3 {
    nested: Nested = Nested{ inner: Inner{ num: 42, text: "bug" }, flag: false };

    init() {
        self.nested = Nested{ inner: Inner{ num: 100, text: "hello" }, flag: true };
    }
}