struct MixOptionalDefault {
    a: Int?;
    b: Int = 5;
    c: Bool?;
    d: Bool = true;
}

contract MixOptionalDefaultContract {
    storage: MixOptionalDefault;

    init() {
        self.storage = MixOptionalDefault{
            a:null,
            c:null,
        };
    }
}