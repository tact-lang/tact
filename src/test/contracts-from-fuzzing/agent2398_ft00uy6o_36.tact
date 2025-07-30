struct Rec {
    a: Int;
    b: Bool;
    c: String;
}

contract MultiPersist {
    r1: Rec;
    r2: Rec;
    r3: Rec;

    init() {
        self.r1 = Rec{ a:1, b:true, c:"one" };
        self.r2 = Rec{ a:2, b:false, c:"two" };
        self.r3 = Rec{ a:3, b:true, c:"three" };
    }
}