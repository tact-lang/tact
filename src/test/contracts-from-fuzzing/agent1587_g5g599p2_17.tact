struct OptionalNested {
    inner: Int?;
}

contract OptionalPersists {
    field: OptionalNested?;

    init() {
        self.field = null;
    }
}