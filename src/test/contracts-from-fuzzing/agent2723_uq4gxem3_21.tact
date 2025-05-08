struct DeepDefault {
    inner: Int = 10;
}

struct OuterDefault {
    nested: DeepDefault = DeepDefault{};
}

contract StructDefaults {
    s: OuterDefault;
    init() {
        self.s = OuterDefault{};
    }
}