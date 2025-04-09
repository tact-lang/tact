struct MixedDefaults {
    a: Int = 1;
    b: Int?;
    c: Bool = true;
    d: Bool?;
    e: String = "hello";
    f: String?;
}

contract MixedDefaultsContract {
    s: MixedDefaults;

    init() {
        self.s = MixedDefaults{
            b:null,
            d:true,
            f:null
        };
    }
}