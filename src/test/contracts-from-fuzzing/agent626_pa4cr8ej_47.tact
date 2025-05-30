struct DeepDefaults {
    x: Int = 1;
    y: Int? = 2;
    z: String = "abc";
}

struct WrapDef {
    d: DeepDefaults;
}

contract NestedDefaults {
    w: WrapDef;

    init() {
        self.w = WrapDef{ d: DeepDefaults{} };
    }
}