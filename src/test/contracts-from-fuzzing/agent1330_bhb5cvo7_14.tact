struct MixOptionDefault {
    i: Int?;
    b: Bool? = false;
    s: String? = "abc";
}

contract TestMix {
    data: MixOptionDefault;

    init() {
        self.data = MixOptionDefault{
            i: null
        };
    }
}