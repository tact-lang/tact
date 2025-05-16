struct BoolBundle {
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

contract BooleanFlood {
    flags: BoolBundle;

    init() {
        self.flags = BoolBundle{
            b1:true,b2:false,b3:true,b4:false,b5:true,
            b6:true,b7:false,b8:true,b9:true,b10:true,
            b11:false,b12:true,b13:false,b14:false,b15:true
        };
    }
}
