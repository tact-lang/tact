struct MixOptDef {
    a: Int = 1;
    b: Bool?;
    c: String = "hello";
    d: Bool = false;
    e: String?;
}

contract MixDefaults {
    m: MixOptDef;

    init() {
        self.m = MixOptDef{
            b: true,
            e: null
        };
    }
}