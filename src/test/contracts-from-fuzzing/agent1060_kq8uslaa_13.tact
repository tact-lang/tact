struct BoolMix {
    a: Bool;
    b: Int;
    c: Bool;
    d: Int;
    e: Bool;
}

contract MixBoolInt {
    mixed: BoolMix;

    init() {
        self.mixed = BoolMix{
            a: true,
            b: 42,
            c: false,
            d: -5,
            e: true
        };
    }
}