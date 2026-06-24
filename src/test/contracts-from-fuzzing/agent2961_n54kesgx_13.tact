struct HasDefaults {
    x: Int = 1;
    y: Bool = false;
    s: String = "str";
}

contract DefaultsStruct {
    data: HasDefaults;
    init() {
        self.data = HasDefaults{};
    }
}