struct VariedDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract DefaultsMix {
    info: VariedDefaults;
    init() {
        self.info = VariedDefaults{};
    }
}