struct OptionalInner {
    foo: Int?;
    bar: Bool?;
}

struct NestedOptional {
    inner: OptionalInner?;
}

contract OptionalTest {
    testField: NestedOptional;

    init() {
        self.testField = NestedOptional {
            inner: null
        };
    }
}