struct OptionalBoolStr {
    optBool: Bool?;
    optStr: String?;
}

contract NestedNulls {
    data: OptionalBoolStr?;

    init() {
        self.data = null;
    }
}