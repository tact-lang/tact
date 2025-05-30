struct MultiDefaults {
    a: Int = 1;
    b: Int? = null;
    c: Bool = true;
    d: Bool? = null;
    e: Int = 5;
}

contract StructMultiDefaults {
    val: MultiDefaults = MultiDefaults{};

    init() {
        self.val = MultiDefaults{};
    }
}