struct ManyBooleans {
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
}

contract BoolPacking {
    data: ManyBooleans = ManyBooleans{
        b1:true, b2:false, b3:true,b4:true,b5:false,b6:true,b7:false,b8:true,b9:true,b10:false,b11:false,b12:true
    };
}