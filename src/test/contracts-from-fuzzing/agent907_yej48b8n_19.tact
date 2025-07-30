struct ManyBooleans {
    b0: Bool;
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
    b6: Bool;
    b7: Bool;
}

contract BitPacking {
    bits: ManyBooleans;

    init() {
        self.bits = ManyBooleans{b0:true,b1:false,b2:true,b3:false,b4:true,b5:false,b6:true,b7:false};
    }
}