struct SDefaults {
    a: Int = 1;
    b: String = "s";
    c: Bool = false;
}

contract UseDefaults {
    f: SDefaults;
    
    init() {
        self.f = SDefaults{};
    }
}