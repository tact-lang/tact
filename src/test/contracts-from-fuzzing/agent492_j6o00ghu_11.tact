struct NestedOptionalDefault {
    i: Int? = null;
    s: String? = null;
    b: Bool? = null;
}

contract OptionalDefaultFields {
    val: NestedOptionalDefault;

    init() {
        self.val = NestedOptionalDefault{};
    }
}