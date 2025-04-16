struct OptionalNested {
    inner: Int?;
}

contract OptionalNestedFieldTest {
    s: OptionalNested;

    init() {
        self.s = OptionalNested{
            inner: null
        };
    }
}