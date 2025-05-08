struct BoolMix {
    b1: Bool;
    b2: Bool?;
    b3: Bool;
    b4: Bool?;
}

contract TestContract {
    f: BoolMix;
    
    init() {
        self.f = BoolMix{b1:true, b2:false, b3:true, b4:null};
    }
}
