struct NestedDefaults {
    a: Int = 1;
    sub: SubDefaults;
}

struct SubDefaults {
    x: Int = 100;
    y: Bool = false;
}

contract NestedDefaultsContract {
    s: NestedDefaults;
    init() {
        self.s = NestedDefaults{ sub: SubDefaults{} };
    }
}