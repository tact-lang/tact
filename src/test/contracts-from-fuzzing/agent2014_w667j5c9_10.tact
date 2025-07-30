struct TenBools {
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

contract LotsOfBools {
    bools: TenBools;

    init() {
        self.bools = TenBools{
            b1:true,b2:true,b3:true,b4:true,b5:true,
            b6:false,b7:false,b8:false,b9:false,b10:false
        };
    }
}