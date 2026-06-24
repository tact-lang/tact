struct InnerDefaults {
    a: Int? = null;
    b: String? = null;
}

contract StructFieldWithInnerDefaults {
    x: InnerDefaults = InnerDefaults{};
}