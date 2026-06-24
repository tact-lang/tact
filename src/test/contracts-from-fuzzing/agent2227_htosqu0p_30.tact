struct MultiNestedDefaults {
    x: Int = 1;
    y: Bool = false;
}

struct OuterDefaults {
    inner: MultiNestedDefaults = MultiNestedDefaults{};
}

contract DefaultsChain {
    val: OuterDefaults = OuterDefaults{};
}