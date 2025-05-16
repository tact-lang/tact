struct MixOpt {
    a: Int?;
    b: Bool;
    c: String?;
    d: Bool?;
    e: Int;
}

contract OptionalMix {
    val: MixOpt;
    init() {
        self.val = MixOpt{
            a: null,
            b: true,
            c: null,
            d: false,
            e: 42
        };
    }
}