struct OptionalMix {
    a: Int?;
    s: String?;
    b: Bool?;
    addr: Address?;
}

contract OptMixTest {
    data: OptionalMix = OptionalMix{
        a: null,
        s: null,
        b: null,
        addr: null
    };
}