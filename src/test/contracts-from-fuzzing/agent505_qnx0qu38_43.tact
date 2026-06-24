struct DeepDefaults {
    a: Int = 1;
    b: Bool? = null;
    s: String = "x";
}

contract DeepDefaultsContract {
    val: DeepDefaults = DeepDefaults{};

    init() {
        self.val = self.val;
    }

    receive() {
        self.val = self.val;
    }
}