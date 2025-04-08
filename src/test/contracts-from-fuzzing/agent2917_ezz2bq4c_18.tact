struct DeepDefaults {
    a: Int = 0;
    b: Bool = true;
    c: String = "def";
    d: Int? = null;
    e: String? = null;
}

contract DefaultsStructHeld {
    s: DeepDefaults;

    init() {
        self.s = DeepDefaults{};
    }
}
