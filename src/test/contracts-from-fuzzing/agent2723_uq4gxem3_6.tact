struct OptionalNested {
    inner: Int?;
}

contract OptionalDeepTest {
    nested: OptionalNested?;
    init() {
        self.nested = OptionalNested{ inner: 10 };
    }
}