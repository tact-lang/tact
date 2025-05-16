struct BoolMix {
    b1: Bool;
    b2: Bool?;
    b3: Bool;
    b4: Bool?;
}

contract MixBools {
    mix: BoolMix;
    init() {
        self.mix = BoolMix{
            b1: true,
            b2: null,
            b3: false,
            b4: true
        };
    }
}