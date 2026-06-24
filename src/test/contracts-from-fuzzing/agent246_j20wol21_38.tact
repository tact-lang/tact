struct MixTyped {
    i: Int;
    u4: Int as uint4;
    s: String;
    b: Bool;
    o: Int?;
    s2: String?;
}
contract ValueMix {
    m: MixTyped;
    init() {
        self.m = MixTyped{
            i: 7,
            u4: 8,
            s: "abc",
            b: true,
            o: null,
            s2: null,
        };
    }
}