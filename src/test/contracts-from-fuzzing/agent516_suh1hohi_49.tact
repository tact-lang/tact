struct MixedDefaults {
    i: Int = 5;
    b: Bool = false;
    s: String = "hi";
    opt: Int?;
}

contract DefaultStructs {
    f: MixedDefaults;

    init() {
        self.f = MixedDefaults{ i: 1, b: true, s: "bye", opt: null };
    }
}
