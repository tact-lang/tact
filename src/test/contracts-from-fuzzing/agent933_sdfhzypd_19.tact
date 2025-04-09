struct Rec1 {
    a: Int;
}

struct Rec2 {
    rec1: Rec1;
    b: Int;
}

struct Rec3 {
    rec2: Rec2;
    c: Int;
}

contract Test {
    multi: Rec3;
    init() {
        self.multi = Rec3{ rec2: Rec2{ rec1: Rec1{ a: 1 }, b: 2 }, c:3 };
    }
}