struct BoolMix {
    b1: Bool;
    b2: Bool?;
    b3: Bool;
    b4: Bool?;
    b5: Bool;
}

contract ManyBools {
    data: BoolMix;

    init() {
        self.data = BoolMix{
            b1: true,
            b2: null,
            b3: false,
            b4: true,
            b5: false
        };
    }
}
