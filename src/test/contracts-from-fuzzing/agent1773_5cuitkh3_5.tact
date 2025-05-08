struct OptionalNested {
    inner: Int?;
}

contract OptNestedTest {
    val: OptionalNested;

    init() {
        self.val = OptionalNested{ inner: null };
    }
}