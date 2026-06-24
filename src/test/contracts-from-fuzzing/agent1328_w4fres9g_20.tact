struct DeepDefaults {
    a: Int = 1;
    b: Bool = false;
    str: String = "foo";
}

contract DefaultFields {
    val: DeepDefaults;

    init() {
        self.val = DeepDefaults{};
    }
}
