struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
}

struct TopDefaults {
    inner: NestedDefaults = NestedDefaults{};
    s: String = "hi";
}

contract StructDefaults {
    data: TopDefaults;

    init() {
        self.data = TopDefaults{};
    }
}