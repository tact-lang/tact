struct DeepDefaults {
    a: Int = 1;
    b: String = "x";
    c: Bool = true;
}

contract DefaultsEverywhere {
    data: DeepDefaults;

    init() {
        self.data = DeepDefaults{};
    }
}