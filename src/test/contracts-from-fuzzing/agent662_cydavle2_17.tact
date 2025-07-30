struct MixOptionals {
    a: Int as uint32;
    b: Bool?;
    c: String?;
    d: Int?;
}

contract MixOptionalsContract {
    f: MixOptionals;
    init() {
        self.f = MixOptionals{ a:123, b:null, c:"ay", d:null };
    }
}