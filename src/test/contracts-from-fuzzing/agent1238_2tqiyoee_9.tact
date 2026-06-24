struct NestedOptional {
    inner: Int?;
    text: String;
}

contract OptionalStructFieldTest {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            inner: null,
            text: "abc"
        };
    }
}