struct ComboDefaults {
    a: Int = 5;
    b: String = "abc";
    c: Bool = true;
    d: Int?;
}

contract Test {
    combo: ComboDefaults;

    init() {
        self.combo = ComboDefaults{
            a: 10,
            b: "zzz",
            c: false,
            d: null
        };
    }
}