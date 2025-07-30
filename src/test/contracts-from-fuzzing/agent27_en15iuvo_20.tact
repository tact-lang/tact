struct Rec1 {
    a: Int;
}

struct Rec2 {
    rec1: Rec1?;
}

contract CrossOpt {
    r: Rec2;

    init() {
        self.r = Rec2{ rec1: null };
    }
}