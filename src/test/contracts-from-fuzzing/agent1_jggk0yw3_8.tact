struct NullableNested {
    inner: Int?;
    text: String;
}

contract NullableNestedTest {
    s: NullableNested?;

    init() {
        self.s = NullableNested{
            inner: null,
            text: "hi",
        };
    }
}