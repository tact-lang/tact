struct DeepDefaults {
    a: Int = 1;
}

struct OuterDefaultNest {
    d: DeepDefaults = DeepDefaults{};
}

contract DeepDefaultContract {
    outer: OuterDefaultNest = OuterDefaultNest{};

    init() {
        self.outer = OuterDefaultNest{};
    }
}