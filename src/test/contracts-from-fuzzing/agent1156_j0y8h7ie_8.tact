struct OptionalsAndDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Int = 123;
    f: Bool = true;
}

contract MixOptDef {
    mixed: OptionalsAndDefaults = OptionalsAndDefaults{};
    init() {}
}