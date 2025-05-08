struct DeepDefaults {
    a: Int = 1;
    b: Bool = true;
    c: Int?;
}

contract DefaultsInStruct {
    val: DeepDefaults;

    init() {
        self.val = DeepDefaults{};
    }
}
