struct MixOpt {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
}

contract StructOptionalMix {
    data: MixOpt;

    init() {
        self.data = MixOpt{
            a: 100,
            b: null,
            c: "hello",
            d: null
        };
    }
}