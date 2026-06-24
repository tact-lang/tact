struct NestedStructWithDefault {
    a: Int = 1;
    b: Bool = false;
}

contract NestedDefaults {
    field: NestedStructWithDefault = NestedStructWithDefault{};
}