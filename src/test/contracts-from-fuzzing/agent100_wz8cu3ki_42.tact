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

contract Test43 {
    flags: ManyBools;

    init() {
        self.flags = ManyBools{ b1:true,b2:true,b3:false,b4:false,b5:true,b6:false,b7:true,b8:false };
    }
}