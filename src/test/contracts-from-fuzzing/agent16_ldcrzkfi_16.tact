struct OptionalMix {
    i: Int?;
    b: Bool;
    s: String;
    optBool: Bool?;
    optStr: String?;
}

contract OptMixUsage {
    data: OptionalMix;

    init() {
        self.data = OptionalMix{
            i: null,
            b: false,
            s: "hello",
            optBool: null,
            optStr: null
        };
    }
}