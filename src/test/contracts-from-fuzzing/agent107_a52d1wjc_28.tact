struct DefMix {
    a: Int = 1;
    b: Int?;
    c: Int = 3;
    d: String?;
}

contract DefaultsMix {
    rec: DefMix;

    init() {
        self.rec = DefMix{
            b: null,
            d: null,
        };
    }
}