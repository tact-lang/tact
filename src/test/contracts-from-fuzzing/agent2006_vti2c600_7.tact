struct DeepDefaults1 {
    x: Int = 1;
}

struct DeepDefaults2 {
    a: DeepDefaults1 = DeepDefaults1{};
}

contract NestedDefaults {
    d: DeepDefaults2;
    init() {
        self.d = DeepDefaults2{};
    }
}