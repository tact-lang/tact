struct HasDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "default";
}

contract DefaultsStruct {
    s: HasDefaults;

    init() {
        self.s = HasDefaults{};
    }
}
