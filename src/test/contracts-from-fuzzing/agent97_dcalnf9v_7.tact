struct DeepDefaults {
    x: Int = 1;
    y: Int = 2;
    z: Int = 3;
}

contract DefaultsInStruct {
    val: DeepDefaults;
    init() {
        self.val = DeepDefaults{};
    }
}