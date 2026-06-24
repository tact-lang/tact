struct OptionalNested {
    inner: Int?;
}

contract OptNestedTest {
    optNested: OptionalNested;

    init() {
        self.optNested = OptionalNested{ inner: null };
    }
}
