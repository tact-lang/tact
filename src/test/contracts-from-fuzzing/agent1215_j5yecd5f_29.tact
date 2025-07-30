struct DeepDefaults {
    a: Int = 1;
    b: Bool = false;
}

contract DeepInit {
    param: DeepDefaults;

    init() {
        self.param = DeepDefaults{};  // should assign defaults
    }
}