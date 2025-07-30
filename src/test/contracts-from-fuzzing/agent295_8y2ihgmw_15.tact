struct MixedOptionalDefaults {
    a: Int?;
    b: Bool = true;
    c: String?;
    d: Int = 5;
    e: Bool?;
}

contract MixOptDef {
    val: MixedOptionalDefaults;

    init() {
        self.val = MixedOptionalDefaults{
            a: null,
            c: null,
            e: null
        };
    }
}