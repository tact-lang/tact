struct Defaults {
    foo: Int = 0;
    flag: Bool = false;
    optStr: String?;  
}

contract StructWithDefaults {
    s: Defaults;

    init() {
        self.s = Defaults{};
    }
}