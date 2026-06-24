struct DeepDefaults {
    num: Int = 1;
    flag: Bool = false;
}

struct MiddleDefaults {
    inner: DeepDefaults = DeepDefaults{};
}

contract MultiLayerDefaultsTest {
    data: MiddleDefaults = MiddleDefaults{};

    init() {
        self.data = MiddleDefaults{};
    }
}