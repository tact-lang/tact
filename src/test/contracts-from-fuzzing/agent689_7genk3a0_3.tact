struct OptionalNested {
    inner: Int?;
}

contract OptionalNestedStorage {
    data: OptionalNested;
    init() {
        self.data = OptionalNested{ inner: null };
    }
}