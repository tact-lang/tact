struct SRec {
    a: Int;
    b: Bool;
    c: String;
}

contract RecTest {
    s1: SRec;
    s2: SRec;
    s3: SRec;

    init() {
        self.s1 = SRec{a:1,b:true,c:"x"};
        self.s2 = SRec{a:2,b:false,c:"y"};
        self.s3 = SRec{a:3,b:true,c:"z"};
    }
}