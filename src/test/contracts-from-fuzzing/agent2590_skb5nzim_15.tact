struct BoolDefaults {
    a: Bool = true;
    b: Bool = false;
    c: Bool = true;
}

contract BoolDefaultsContract {
    foo: BoolDefaults;
    init() {
        self.foo = BoolDefaults{};
    }
}