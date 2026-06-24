struct Rec1 {
    f1: Int;
}

struct Rec2 {
    rec1: Rec1;
    f2: Int;
}

struct Rec3 {
    rec2: Rec2;
    f3: Int;
}

contract RecursionLike {
    val: Rec3;
    init() {
        self.val = Rec3{
            rec2: Rec2{
                rec1: Rec1{f1: 11},
                f2: 22
            },
            f3: 33
        };
    }
}