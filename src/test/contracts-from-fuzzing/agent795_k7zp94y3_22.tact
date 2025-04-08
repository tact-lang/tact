struct MixPack {
    f1: Bool;
    f2: Int as uint4;
    f3: Bool;
    f4: Int as uint4;
    f5: Bool;
    f6: Int as uint4;
    f7: Bool;
    f8: Int as uint4;
    f9: Bool;
    f10: Int as uint4;
}

contract Test {
    mixed: MixPack = MixPack{
        f1:true, f2:1,
        f3:false, f4:2,
        f5:true, f6:3,
        f7:false, f8:4,
        f9:true, f10:5
    };
}