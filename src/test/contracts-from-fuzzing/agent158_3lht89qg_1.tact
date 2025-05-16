struct Nested {
    inner: InnerStructOption;
}

struct InnerStructOption {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract DeepOptionalNestedTest {
    val: Nested;
    init() {
        self.val = Nested{
            inner: InnerStructOption{
                foo: 10,
                bar: true,
                baz: "hello",
            }
        };
    }
}