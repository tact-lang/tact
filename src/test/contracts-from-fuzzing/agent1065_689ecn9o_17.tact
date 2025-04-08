struct MixedOptionalDefaults {
    a: Int? = null;
    b: Bool = true;
    c: Int?;
    d: Bool?;
    e: Int = 1;
}

contract MixedOptDefaults {
    data: MixedOptionalDefaults;
    init() {
        self.data = MixedOptionalDefaults{
            c: 10,
            d: null
        };
    }
}