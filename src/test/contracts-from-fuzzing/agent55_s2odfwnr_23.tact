struct Small1 { f: Int = 1; }
struct Small2 { g: Int = 2; }
struct Small3 { h: Int = 3; }

struct Combo {
    s1: Small1;
    s2: Small2;
    s3: Small3;
}

contract InlinePacked {
    combo: Combo;

    init() {
        self.combo = Combo{ s1: Small1{}, s2: Small2{}, s3: Small3{} };
    }
}
