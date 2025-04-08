struct SDefaultMix {
    a: Int;
    b: Int = 5;
    c: Int?;
    d: Bool? = null;
}

contract DefaultMixContract {
    s: SDefaultMix;

    init() {
        self.s = SDefaultMix{
            a: 2,
            c: null,
        };
    }
}