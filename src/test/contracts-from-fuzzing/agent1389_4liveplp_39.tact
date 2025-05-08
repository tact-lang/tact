struct DeepDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "def";
}

contract DefaultsNested {
    val: DeepDefaults;

    init() {
        self.val = DeepDefaults{};
    }
}