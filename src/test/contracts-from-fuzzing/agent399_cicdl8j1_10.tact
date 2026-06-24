contract OptionalNestedStructTest {
    inner: InnerStruct?;

    init() {
        self.inner = null;
    }
}

struct InnerStruct {
    a: Int?;
    b: Bool?;
}