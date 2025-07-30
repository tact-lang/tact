struct NestedOptDefaults {
    a: Int? = null;
    b: Bool? = null;
}

contract NestedOptDefaultsContract {
    f: NestedOptDefaults = NestedOptDefaults{};
}