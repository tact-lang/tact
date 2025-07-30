struct MixedDefaults {
    a: Int?;
    b: String?;
    c: Int as int16;
    d: Bool = true;
}

contract ComboDefaults {
    val: MixedDefaults;

    init() {
        self.val = MixedDefaults{
            a: 42,
            b: null,
            c: -12345
        };
    }
}