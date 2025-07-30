struct Rec {
    ch: String?;
}

contract Recur {
    a: Rec;
    b: Rec;
    c: Rec;

    init() {
        self.a = Rec{ ch:null };
        self.b = Rec{ ch:"val" };
        self.c = Rec{ ch:null };
    }
}