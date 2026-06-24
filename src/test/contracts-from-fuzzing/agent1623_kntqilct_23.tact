struct LotsDefaults {
    a: Int = 1;
    b: Bool = true;
    c: Int = 2;
    d: Bool = false;
    e: Int = 3;
    f: Bool = true;
    g: Int = 4;
    h: Bool = false;
}

contract ManyDefaults {
    data: LotsDefaults;
    init() {
        self.data = LotsDefaults{};
    }
}