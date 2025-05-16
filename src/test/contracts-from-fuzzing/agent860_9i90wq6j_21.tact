struct Imm {
    a: Int;
}

contract InitWithDefaults {
    f1: Int = 99;
    f2: Bool? = null;
    f3: String = "hello";
    f4: Imm = Imm{a:7};

    init() {
        self.f1 = 100;
        self.f2 = true;
        self.f3 = "changed";
        self.f4 = Imm{a:8};
    }
}