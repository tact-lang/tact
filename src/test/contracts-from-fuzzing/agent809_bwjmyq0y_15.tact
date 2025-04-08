struct MixedDefaults {
    a: Int = 1;
    b: Int?;
    c: Bool = false;
    d: Bool?;
    e: String = "abc";
    f: String?;
}

contract MixedDefaultsContract {
    data: MixedDefaults;

    init() {
        self.data = MixedDefaults{
            a: 10,
            b: null,
            c: true,
            d: null,
            e: "xyz",
            f: null
        };
    }
}