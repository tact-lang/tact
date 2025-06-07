struct DeepDefaults {
    nested: Level;
}

struct Level {
    x: Int = 5;
    y: Bool = false;
}

contract NestedDefaults {
    s: DeepDefaults;

    init() {
        self.s = DeepDefaults{
            nested: Level{},
        };
    }
}
