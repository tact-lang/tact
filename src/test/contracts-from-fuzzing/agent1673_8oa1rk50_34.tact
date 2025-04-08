struct DeepDefaults {
    a: Int? = null;
    b: Int? = null;
    c: Int? = null;
}

contract DeepNestedDefaults {
    data: DeepDefaults;

    init() {
        self.data = DeepDefaults{};
    }
}