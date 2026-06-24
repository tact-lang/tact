struct SDefaults {
    b: Bool = true;
    i: Int = 100;
    s: String = "def";
}

contract DefaultsMix {
    fld: SDefaults;
    
    init() {
        self.fld = SDefaults{};
    }
}