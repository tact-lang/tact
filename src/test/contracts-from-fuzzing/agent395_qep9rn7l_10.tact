struct InnerOptDefaults {
    x: Int? = null;
    y: Bool? = true;
}

struct OuterWithDefaults {
    inner: InnerOptDefaults = InnerOptDefaults{};
    note: String = "init";
}

contract NestedDefaults {
    data: OuterWithDefaults;

    init() {
        self.data = OuterWithDefaults{};
    }
}
