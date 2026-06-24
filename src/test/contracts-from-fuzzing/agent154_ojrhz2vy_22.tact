struct Rec1 {
    a: Int;
}

struct Rec2 {
    a: Int;
    r1: Rec1;
}

struct Rec3 {
    a: Int;
    r1: Rec1;
    r2: Rec2;
}

contract BigNest {
    val: Rec3;

    init() {
        self.val = Rec3 {
            a: 1,
            r1: Rec1 { a: 2 },
            r2: Rec2 { a:3, r1: Rec1 { a:4 } }
        };
    }
}