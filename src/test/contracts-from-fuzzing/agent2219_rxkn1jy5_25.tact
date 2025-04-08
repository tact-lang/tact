struct Rec1 {
    a: Int;
    b: Bool;
}

struct Rec2 {
    c: String;
    d: Int;
}

contract MultiRecs {
    r1: Rec1;
    r2: Rec2;

    init() {
        self.r1 = Rec1{ a:5, b:true };
        self.r2 = Rec2{ c:"test", d:6 };
    }
}