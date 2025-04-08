struct BoolIntMix {
    a: Bool;
    b: Int;
    c: Bool;
    d: Int;
}

contract MixedTypes {
    f: BoolIntMix;
    init() {
        self.f = BoolIntMix{
            a: true,
            b: 123,
            c: false,
            d: -456,
        };
    }
}