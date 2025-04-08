struct DeepDefaults {
    x: Int = 1;
    y: Bool? = null;
    z: String = "hi";
}

contract DefaultsContract {
    s: DeepDefaults;

    init() {
        self.s = DeepDefaults{};
    }
}