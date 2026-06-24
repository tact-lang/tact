struct DeepDefaults {
    a: Int = 1;
    b: Bool = false;
}

struct MidDefaults {
    d: DeepDefaults;
}

contract ChainDefaults {
    val: MidDefaults;

    init() {
        self.val = MidDefaults{ d: DeepDefaults{} };
    }
}