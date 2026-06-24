struct BoolDefaults {
    a: Bool = false;
    b: Bool = true;
}

contract BoolDefStore {
    f: BoolDefaults;
    init() {
        self.f = BoolDefaults{ a: true, b: false };
    }
}