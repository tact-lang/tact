struct InlineDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hey";
    d: Int?;
    e: Bool?;
}

contract DefaultsChain {
    storage: InlineDefaults;

    init() {
        self.storage = InlineDefaults{};
    }
}