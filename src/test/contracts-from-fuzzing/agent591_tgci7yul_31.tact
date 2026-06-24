struct OptionalStr {
    s: String?;
}

contract OptionalEmptyStr {
    field: OptionalStr?;
    init() {
        self.field = null;
    }
}