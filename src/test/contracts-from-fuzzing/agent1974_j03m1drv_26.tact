struct Rec {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool;
}

contract RepeatTest {
    v1: Rec;
    v2: Rec;
    v3: Rec;
    v4: Rec;

    init() {
        self.v1 = Rec{ a:1, b:true, c:null, d:false };
        self.v2 = Rec{ a:2, b:false, c:null, d:true };
        self.v3 = Rec{ a:3, b:true, c:4, d:false };
        self.v4 = Rec{ a:5, b:false, c:6, d:true };
    }
}
