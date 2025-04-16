struct DeepDefaults {
    x: Int = 1;
}

struct MidDefaults {
    d: DeepDefaults = DeepDefaults{};
}

struct TopDefaults {
    m: MidDefaults = MidDefaults{};
}

contract MultiDefaultStruct {
    storage: TopDefaults;
    init() {
        self.storage = TopDefaults{};
    }
}