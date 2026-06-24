struct Rec {
    a: Int;
    b: Int?;
    c: Int;
    d: Int?;
}

contract ManyOptionalMix {
    f1: Rec;
    f2: Rec;
    f3: Rec;

    init() {
        self.f1 = Rec{ a:1, b:null, c:2, d:null };
        self.f2 = Rec{ a:3, b:4, c:5, d:null };
        self.f3 = Rec{ a:6, b:null, c:7, d:8 };
    }
}