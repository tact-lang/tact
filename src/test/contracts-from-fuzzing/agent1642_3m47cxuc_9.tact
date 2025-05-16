struct HasDefaults {
    a: Int = 1;
    b: Int = 2;
    c: String = "default";
    d: Bool = true;
    e: Int?;
}

contract DefaultsPersistent {
    def: HasDefaults;

    init() {
        self.def = HasDefaults{};
    }
}