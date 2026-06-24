struct MixOptionalDefault {
    s: String?;
    x: Int = 42;
    b: Bool?;
}

contract MixOptDef {
    val: MixOptionalDefault;

    init() {
        self.val = MixOptionalDefault{
            s: null,
            b: null,
        };
    }
}