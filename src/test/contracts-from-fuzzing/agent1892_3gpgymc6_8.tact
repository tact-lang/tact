struct NestedOptional {
    inner: OptionalLevel;
}

struct OptionalLevel {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeText: String?;
}

contract NestedOptionalContract {
    optNested: NestedOptional?;

    init() {
        self.optNested = null;
    }
}