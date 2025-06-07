struct BooleanMix {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    opt: Bool?;
}

contract ManyBools {
    data: BooleanMix;
    init() {
        self.data = BooleanMix {
            b1: true, b2: false, b3: true, opt: null
        };
    }
}
