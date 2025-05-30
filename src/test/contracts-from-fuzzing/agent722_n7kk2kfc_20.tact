struct DeepDefaults {
    a: Int = 3;
    b: Bool = false;
}

struct MiddleDefaults {
    inner: DeepDefaults = DeepDefaults{};
}

contract NestedDefaults {
    data: MiddleDefaults;

    init() {
        self.data = MiddleDefaults{};
    }
}