struct BoolIntMix {
    b1: Bool;
    i1: Int;
    b2: Bool;
    i2: Int;
    b3: Bool;
}

contract Test {
    data: BoolIntMix;

    init() {
        self.data = BoolIntMix{
            b1:true, i1:123, b2:false, i2:-456, b3:true
        };
    }
}