struct NestedWithDefaults {
    x: Int = 0;
    y: String = "";
}

contract DefaultsDeep {
    a: NestedWithDefaults = NestedWithDefaults{};
    b: NestedWithDefaults = NestedWithDefaults{};
}