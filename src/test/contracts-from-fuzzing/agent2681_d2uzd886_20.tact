struct ManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract DefaultsInStruct {
    s: ManyDefaults;

    init() {
        self.s = ManyDefaults{};
    }
}