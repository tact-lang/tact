struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct WrapNested {
    inner: NestedOptionals?;
    d: Int;
}

contract OptionalNestedStructTest {
    data: WrapNested;

    init() {
        self.data = WrapNested {
            inner: null,
            d: 42
        };
    }
}