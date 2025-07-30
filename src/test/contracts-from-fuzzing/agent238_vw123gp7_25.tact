struct BoolIntMix {
    f1: Bool;
    f2: Int;
    f3: Bool;
    f4: Int;
}

contract MixContract {
    data: BoolIntMix;

    init() {
        self.data = BoolIntMix{
            f1:true,f2:1,f3:false,f4:2
        };
    }
}