struct DeepDefaults {
    x: Int = 1;
    y: String = "def";
}

struct MidDefaults {
    inner: DeepDefaults = DeepDefaults{};
}

contract ContractDefaults {
    mid: MidDefaults;

    init() {
        self.mid = MidDefaults{};
    }
}