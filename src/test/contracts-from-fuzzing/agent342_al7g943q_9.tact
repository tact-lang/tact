struct NestedDefaults {
    a: Int = 3;
    b: Bool = false;
}

struct LargerDefaultStruct {
    x: Int = 10;
    nested: NestedDefaults = NestedDefaults{};
    y: Bool = true;
}

contract NestedDefaultsContract {
    s: LargerDefaultStruct;

    init() {
        self.s = LargerDefaultStruct{};
    }
}
