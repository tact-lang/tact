struct DeeplyNestedDefaults {
    x: Int = 1;
    y: Bool = false;
}

struct OuterLevel {
    inner: DeeplyNestedDefaults = DeeplyNestedDefaults{};
}

contract OuterNestedDefaults {
    val: OuterLevel = OuterLevel{};
}
