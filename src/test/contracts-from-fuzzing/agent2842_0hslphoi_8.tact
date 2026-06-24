struct ManyBools {
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
    b16: Bool;
    b17: Bool;
    b18: Bool;
    b19: Bool;
}

contract ManyBoolsStore {
    flags: ManyBools;

    init() {
        self.flags = ManyBools{
            b0:true,b1:true,b2:true,b3:true,b4:true,
            b5:true,b6:true,b7:true,b8:true,b9:true,
            b10:true,b11:true,b12:true,b13:true,b14:true,
            b15:true,b16:true,b17:true,b18:true,b19:true
        };
    }
}