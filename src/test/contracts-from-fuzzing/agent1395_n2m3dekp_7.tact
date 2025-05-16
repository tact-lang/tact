struct OptionalNested {
    inner: Int?;
    text: String?;
}

contract OptionalNestedContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            inner: null,
            text: null
        };
    }
}