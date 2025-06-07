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

contract FlagStorage {
    flags: ManyBools;
    init() {
        self.flags = ManyBools{
            b1:true,b2:true,b3:true,b4:true,b5:true,b6:true,b7:true,b8:true
        };
    }
}