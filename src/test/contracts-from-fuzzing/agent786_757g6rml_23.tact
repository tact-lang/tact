struct HasManyBools {
    b0: Bool;
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
    b11: Bool;
    b12: Bool;
    b13: Bool;
    b14: Bool;
    b15: Bool;
}

contract PackedBools {
    bits: HasManyBools;

    init() {
        self.bits = HasManyBools{
            b0:true,b1:false,b2:true,b3:false,
            b4:true,b5:false,b6:true,b7:false,
            b8:true,b9:false,b10:true,b11:false,
            b12:true,b13:false,b14:true,b15:false
        };
    }
}