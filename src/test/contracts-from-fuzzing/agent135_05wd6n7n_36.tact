struct SDefaultMix {
    a: Int = 4;
    b: Int?;
    c: Bool = true;
    d: String?;
}

contract SDMix {
    prop: SDefaultMix;

    init() {
        self.prop = SDefaultMix{
            b: null,
            d: null
        };
    }
}
