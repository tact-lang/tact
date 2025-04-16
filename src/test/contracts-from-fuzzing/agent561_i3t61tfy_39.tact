struct SRec {
    flag: Bool;
    num: Int;
    optStr: String?;
}

contract SRecMany {
    s1: SRec;
    s2: SRec;
    s3: SRec;

    init() {
        self.s1 = SRec{flag:true,num:1,optStr:null};
        self.s2 = SRec{flag:false,num:2,optStr:null};
        self.s3 = SRec{flag:true,num:3,optStr:null};
    }
}