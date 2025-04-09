struct BoolChain {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
    b6: Bool;
    b7: Bool;
    b8: Bool;
    b9: Bool;
    b10: Bool;
}

contract ManyBools {
    flags: BoolChain;

    init() {
        self.flags = BoolChain{
            b1:true,b2:true,b3:true,b4:true,b5:true,b6:true,b7:true,b8:true,b9:true,b10:true
        };
    }
}
