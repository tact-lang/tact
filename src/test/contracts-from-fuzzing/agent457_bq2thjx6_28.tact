struct NestedOptional {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptionalDefaults {
    data: NestedOptional = NestedOptional{};
}