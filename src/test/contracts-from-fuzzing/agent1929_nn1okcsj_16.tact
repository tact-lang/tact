struct DeepDefaults {
    a: Int = 1;
    b: SubDefault;
}

struct SubDefault {
    x: Int = 2;
    y: Bool = false;
}

contract NestedDefaults {
    s: DeepDefaults;
    init() {
        self.s = DeepDefaults{
            b: SubDefault{}
        };
    }
}