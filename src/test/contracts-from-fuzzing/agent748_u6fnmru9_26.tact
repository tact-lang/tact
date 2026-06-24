struct OneBit {
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
    packed: OneBit;

    init() {
        self.packed = OneBit{
            b1:true,b2:false,b3:true,b4:true,b5:false,
            b6:false,b7:true,b8:false,b9:true,b10:true
        };
    }
}