struct BoolDefaults {
    a: Bool = false;
    b: Bool = true;
    c: Bool;
}

contract DefaultsOptionalImplicit {
    store: BoolDefaults;

    init() {
        self.store = BoolDefaults{ c: false };
    }
}