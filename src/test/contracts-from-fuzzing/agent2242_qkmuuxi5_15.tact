struct Rec1 {
    a: Int;
}
struct Rec2 {
    s: Rec1;
}
struct Rec3 {
    t: Rec2;
}
struct Rec4 {
    u: Rec3;
}

contract MultiRec {
    m: Rec4;

    init() {
        self.m = Rec4{ u: Rec3{ t: Rec2{ s: Rec1{ a: 5 } } } };
    }
}