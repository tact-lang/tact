struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
}

struct OuterDefaults {
    inner: NestedDefaults = NestedDefaults{};
    s: String = "hi";
}

contract DefaultsInNestedStruct {
    data: OuterDefaults;

    init() {
        self.data = OuterDefaults{};
    }
}
