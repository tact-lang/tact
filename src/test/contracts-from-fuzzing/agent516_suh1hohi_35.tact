struct StringsAndBools {
    s1: String;
    s2: String?;
    b1: Bool;
    b2: Bool?;
}

contract StringBoolMix {
    m: StringsAndBools;

    init() {
        self.m = StringsAndBools{
            s1: "hey",
            s2: null,
            b1: true,
            b2: null
        };
    }
}
