struct NestedOptionalS {
    x: Int?;
    y: String?;
}

contract OptionalStructS {
    s: NestedOptionalS?;

    init() {
        self.s = null;
    }
}