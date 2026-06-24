struct HasDefaults {
    a: Int = 5;
    b: String = "default";
    c: Bool = true;
}

contract DefaultsInStruct {
    f: HasDefaults;

    init() {
        self.f = HasDefaults{};
    }
}