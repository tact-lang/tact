struct HasDefaults {
    a: Int = 123;
    b: Bool = false;
    s: String = "x";
}

contract DefaultsStruct {
    def: HasDefaults;
    init() {
        self.def = HasDefaults{};
    }
}