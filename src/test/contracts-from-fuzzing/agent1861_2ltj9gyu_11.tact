struct OptionalNested {
    x: Int?;
    y: String?;
}

contract OptionalNestedContract {
    data: OptionalNested?;

    init() {
        self.data = null;
    }
}