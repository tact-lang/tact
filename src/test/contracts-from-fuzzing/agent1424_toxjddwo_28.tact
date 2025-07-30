struct S2 {
    aa: Int;
    bb: Int?;
    cc: Bool;
    dd: String;
}

contract LargeNumberFields {
    x1: S2;
    x2: S2;
    x3: S2;
    x4: S2;

    init() {
        self.x1 = S2{aa:1,bb:null,cc:true,dd:"a"};
        self.x2 = S2{aa:2,bb:null,cc:false,dd:"b"};
        self.x3 = S2{aa:3,bb:null,cc:true,dd:"c"};
        self.x4 = S2{aa:4,bb:null,cc:false,dd:"d"};
    }
}