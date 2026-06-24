struct DeepDefaults {
    a: Int = 11;
    b: Bool? = null;
    c: String = "hello";
}

contract StructDefaults {
    dd: DeepDefaults;
    init() {
        self.dd = DeepDefaults{};
    }
}
