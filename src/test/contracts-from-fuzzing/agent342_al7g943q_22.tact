struct NestedDeepDefaults {
    a: Int = 1;
}

struct Level2 {
    nested: NestedDeepDefaults = NestedDeepDefaults{};
}

struct Level1 {
    nested2: Level2 = Level2{};
}

contract DeepDefaultsContract {
    f: Level1;

    init() {
        self.f = Level1{};
    }
}
