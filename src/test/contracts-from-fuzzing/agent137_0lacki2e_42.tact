struct BoolIntMix {
    b1: Bool;
    i1: Int;
    b2: Bool;
    i2: Int;
    b3: Bool;
    i3: Int;
}

contract TestBoolIntMix {
    f: BoolIntMix;
    init() {
        self.f = BoolIntMix{
            b1:true,i1:1,b2:false,i2:2,b3:true,i3:3
        };
    }
}