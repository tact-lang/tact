struct ManyBools {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
    b6: Bool;
    b7: Bool;
    b8: Bool;
}

contract BooleansContract {
    flags: ManyBools;

    init() {
        self.flags = ManyBools{b1:true,b2:false,b3:true,b4:false,b5:true,b6:true,b7:false,b8:true};
    }
}