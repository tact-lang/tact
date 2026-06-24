struct InnerMost {
    secret: String?;
    count: Int?;
}

struct NestedOptional {
    inner: InnerMost?;
}

contract OptionalNestedTest {
    complex: NestedOptional;

    init() {
        self.complex = NestedOptional{
            inner: InnerMost{
                secret: "hello",
                count: 5
            }
        };
    }
}