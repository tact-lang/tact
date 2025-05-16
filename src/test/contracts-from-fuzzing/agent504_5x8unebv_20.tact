struct SBool {
    b1: Bool;
    b2: Bool;
}

struct SOptional {
    intOpt: Int?;
    boolOpt: Bool?;
}

contract StructMultiplex {
    s1: SBool;
    s2: SOptional;

    init() {
        self.s1 = SBool{b1:true,b2:false};
        self.s2 = SOptional{intOpt:123,boolOpt:null};
    }

    receive() {
        let x = self.s1;
        let y = self.s2;
    }
}