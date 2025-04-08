struct NestedOptional {
    inner: InnerOptional?;
}

struct InnerOptional {
    val: Int;
    text: String;
}

contract OptionalNestedTest {
    store: NestedOptional;

    init() {
        self.store = NestedOptional{
            inner: InnerOptional{val: 5, text: "ok"}
        };
    }
}