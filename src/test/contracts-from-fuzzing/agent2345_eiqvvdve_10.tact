struct LargeDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
    f: Bool = true;
    g: Bool = false;
    h: String = "abc";
    i: String? = null;
}

contract ContractWithDefaults {
    st: LargeDefaults;

    init() {
        self.st = LargeDefaults{};
    }
}