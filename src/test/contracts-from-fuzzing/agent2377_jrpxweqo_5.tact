struct OptionalNested {
    inner: Int?;
}

contract OptionalStructInContract {
    nested: OptionalNested?;

    init() {
        self.nested = OptionalNested{
            inner: null,
        };
    }
}