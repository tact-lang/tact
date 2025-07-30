struct Rec {
    s: String;
    opt: Int?;
    flag: Bool;
}

contract MultipleSameStruct {
    r1: Rec;
    r2: Rec?;
    r3: Rec;
    r4: Rec?;

    init() {
        self.r1 = Rec{ s:"r1", opt:1, flag:true };
        self.r2 = null;
        self.r3 = Rec{ s:"r3", opt:null, flag:false };
        self.r4 = Rec{ s:"r4", opt:3, flag:true };
    }
}