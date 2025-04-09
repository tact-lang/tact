struct BoolIntMix {
    f1: Bool;
    f2: Int;
    f3: Bool;
    f4: Int;
    f5: Bool;
}

contract MixedBits {
    data: BoolIntMix;

    init() {
        self.data = BoolIntMix{
            f1:true,f2:42,f3:false,f4:100,f5:true
        };
    }
}