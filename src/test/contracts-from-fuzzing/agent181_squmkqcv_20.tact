struct Pack {
    a: Int;
    b: Bool;
    c: String;
}

contract ManyStructs {
    s1: Pack;
    s2: Pack;
    s3: Pack;

    init() {
        self.s1=Pack{a:1,b:true,c:"a"};
        self.s2=Pack{a:2,b:false,c:"b"};
        self.s3=Pack{a:3,b:true,c:"c"};
    }
}
