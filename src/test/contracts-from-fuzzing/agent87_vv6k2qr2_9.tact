struct NestedOptions {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFields {
    optNested: NestedOptions?;

    init() {
        self.optNested = null;
    }
}
