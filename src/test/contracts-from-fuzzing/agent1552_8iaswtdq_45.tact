struct Rec {
    x: Int;
    y: Bool;
    z: String;
}

contract ManySameRec {
    r1: Rec;
    r2: Rec;
    r3: Rec;
    r4: Rec;

    init() {
        self.r1=Rec{x:1,y:true,z:"a"};
        self.r2=Rec{x:2,y:false,z:"b"};
        self.r3=Rec{x:3,y:true,z:"c"};
        self.r4=Rec{x:4,y:false,z:"d"};
    }
}