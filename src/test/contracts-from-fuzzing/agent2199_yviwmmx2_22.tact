struct NestedDefaults {
    v: Int? = null;
    s: String = "foo";
}

contract StructNestedDefaults {
    data: NestedDefaults;
    init() {
        self.data = NestedDefaults{};
    }
}
