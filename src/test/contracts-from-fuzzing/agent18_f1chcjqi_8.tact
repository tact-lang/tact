struct BoolMix {
    b1: Bool;
    b2: Bool?;
    b3: Bool;
    b4: Bool?;
}

contract BoolMixContract {
    data: BoolMix;
    init() {
        self.data = BoolMix{
            b1:true, b2:null, b3:false, b4:null
        };
    }
}