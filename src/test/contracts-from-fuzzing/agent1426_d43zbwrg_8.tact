struct BoolMix {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
}

contract PackedBools {
    bits: BoolMix;

    init() {
        self.bits = BoolMix{
            b1: true, b2: false, b3: true, b4: false, b5: true
        };
    }
}