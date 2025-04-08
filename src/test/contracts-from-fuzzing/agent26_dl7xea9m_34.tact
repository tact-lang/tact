struct DeepDefaults {
    x: Int? = null;
}

struct Wrap {
    d: DeepDefaults = DeepDefaults{};
}

contract DDTest {
    f: Wrap = Wrap{};
    init() {
        self.f = Wrap{};
    }
}