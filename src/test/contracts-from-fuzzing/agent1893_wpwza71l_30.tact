struct DeepDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "default";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract AllDefaults {
    val: DeepDefaults;

    init() {
        self.val = DeepDefaults{};
    }
}