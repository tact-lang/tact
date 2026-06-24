struct DeepDefaults {
    a: Int = 1;
    b: Bool = false;
}

struct HasDeep {
    nested: DeepDefaults;
}

contract DefNested {
    dd: HasDeep;

    init() {
        self.dd = HasDeep{ nested: DeepDefaults{} };
    }
}