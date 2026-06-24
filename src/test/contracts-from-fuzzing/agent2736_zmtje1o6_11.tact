struct IntsDefaults {
    a: Int = 10;
    b: Int = 20;
    c: Int = 30;
}

contract DefaultsThroughStruct {
    f: IntsDefaults;

    init() {
        self.f = IntsDefaults{};
    }
}