struct MixAll {
    anInt: Int;
    aBool: Bool;
    aStr: String;
    anAddr: Address;
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeStr: String?;
    maybeAddr: Address?;
}

contract BigMix {
    s: MixAll;

    init() {
        self.s = MixAll{
            anInt: 1,
            aBool: false,
            aStr: "hi",
            anAddr: myAddress(),
            maybeInt: null, maybeBool: null, maybeStr: null, maybeAddr: null
        };
    }
}