struct NestedDefaults {
    x: Int = 1;
    y: Bool = true;
}

struct DeepDefaults {
    inner: NestedDefaults = NestedDefaults{};
}

contract TestContract {
    d: DeepDefaults;

    init() {
        self.d = DeepDefaults{};
    }
}