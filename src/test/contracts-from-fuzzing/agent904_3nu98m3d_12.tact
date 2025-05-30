struct OptionMix {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract OptMixContract {
    data: OptionMix;
    init() {
        self.data = OptionMix{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}