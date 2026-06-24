struct InnerOptDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

struct OuterDefaults {
    inner: InnerOptDefaults = InnerOptDefaults{};
    note: String = "set";
}

contract NestedStructsWithDefaults {
    val: OuterDefaults = OuterDefaults{};

    init() {}
}