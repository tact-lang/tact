struct BoolDefaults {
    a: Bool = true;
    b: Bool = false;
    c: Bool;
}

contract TestBoolDefaults {
    f: BoolDefaults;
    init() {
        self.f = BoolDefaults{c:true};
    }
}