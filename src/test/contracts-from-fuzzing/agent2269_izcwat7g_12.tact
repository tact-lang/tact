struct DeepDefaults {
    x: Int = 1;
    y: Bool = false;
    s: String = "";
}

contract NestedDefaults {
    inner: DeepDefaults;

    init() {
        self.inner = DeepDefaults{};
    }
}
