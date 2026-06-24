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

contract TestManyBools {
    allBools: ManyBools;
    init() {
        self.allBools = ManyBools{
            b0:true,b1:false,b2:true,b3:false,b4:true,b5:false,b6:true,b7:false,b8:true,b9:false,
            b10:true,b11:false,b12:true,b13:false,b14:true,b15:false,b16:true,b17:false,b18:true,b19:false
        };
    }
}
