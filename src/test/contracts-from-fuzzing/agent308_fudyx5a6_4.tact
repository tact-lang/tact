struct MixOptionals {
    b1: Bool?;
    b2: Bool;
    i1: Int?;
    i2: Int;
    s1: String?;
    s2: String;
}

contract OptionMix {
    storage: MixOptionals;

    init() {
        self.storage = MixOptionals{
            b1: null,
            b2: true,
            i1: null,
            i2: 42,
            s1: null,
            s2: "xyz",
        };
    }
}
