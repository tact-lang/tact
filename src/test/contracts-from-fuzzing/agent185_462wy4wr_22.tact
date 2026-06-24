struct BoolMix {
    a: Bool;
    b: Bool?;
    c: Bool;
    d: Bool?;
}

contract MixedBools {
    data: BoolMix;

    init() {
        self.data = BoolMix{
            a: true,
            b: null,
            c: false,
            d: true
        };
    }
}