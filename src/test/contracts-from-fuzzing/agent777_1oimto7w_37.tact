struct InnerOptMix {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalsDeepMix {
    store: InnerOptMix?;

    init() {
        self.store = InnerOptMix{
            a: 7,
            b: null,
            c: null,
        };
    }
}