struct MixOptDef {
    x: Int?;
    y: Bool = true;
    z: String?;
}

contract MixOptDefTest {
    m: MixOptDef;

    init() {
        self.m = MixOptDef{
            x: null,
            z: null
        };
    }
}
