struct Rec {
    a: Int;
    b: Bool;
}

contract JustStructs {
    s1: Rec;
    s2: Rec;
    s3: Rec;
    s4: Rec;

    init() {
        self.s1=Rec{a:1,b:true}; self.s2=Rec{a:2,b:false};
        self.s3=Rec{a:3,b:true}; self.s4=Rec{a:4,b:false};
    }
}
