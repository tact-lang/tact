struct NestedDefaults {
    count: Int = 1;
    name: String = "abc";
}

struct Combo {
    details: NestedDefaults = NestedDefaults{};
    flag: Bool = false;
}

contract DefLayers {
    c: Combo;

    init() {
        self.c = Combo{};
    }
}
