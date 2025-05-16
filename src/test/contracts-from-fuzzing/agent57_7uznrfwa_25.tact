struct SStrDefaults {
    s: String = "str";
}

contract StrDefaultsC {
    f1: SStrDefaults;
    f2: SStrDefaults;
    
    init() {
        self.f1 = SStrDefaults{};
        self.f2 = SStrDefaults{};
    }
}