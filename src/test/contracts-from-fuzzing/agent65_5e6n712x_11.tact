struct OptionalMix {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    stringOpt: String?;
}

contract OptionalMixTest {
    data: OptionalMix;

    init() {
        self.data = OptionalMix{
            intOpt: null,
            boolOpt: null,
            addrOpt: null,
            stringOpt: null
        };
    }
}
