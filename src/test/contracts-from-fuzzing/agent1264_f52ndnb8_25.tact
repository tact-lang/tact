struct Rec {
    val: Int;
}

contract ArrayLike {
    r1: Rec;
    r2: Rec;
    r3: Rec;
    r4: Rec;
    r5: Rec;

    init() {
        self.r1 = Rec{ val:1 };
        self.r2 = Rec{ val:2 };
        self.r3 = Rec{ val:3 };
        self.r4 = Rec{ val:4 };
        self.r5 = Rec{ val:5 };
    }
}