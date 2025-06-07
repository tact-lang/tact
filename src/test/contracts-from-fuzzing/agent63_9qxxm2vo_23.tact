struct ManyBools {
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

contract BoolStress {
    flags: ManyBools;

    init() {
        self.flags = ManyBools{
            b1:true,b2:true,b3:true,b4:false,b5:false,b6:true,b7:false,b8:true,b9:false,b10:true,
            b11:true,b12:false,b13:true,b14:false,b15:true
        };
    }
}