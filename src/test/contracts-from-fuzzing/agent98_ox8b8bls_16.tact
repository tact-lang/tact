struct OptionalNested {
    first: Int?;
    second: Int?;
}

contract OptionalDefaults {
    data: OptionalNested?;
    init() {
        self.data = null;
    }
}