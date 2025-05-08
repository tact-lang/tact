struct RecA { val: Int; }
struct RecB { val: RecA; }
struct RecC { val: RecB; }

contract RecursionLike {
    a: RecA;
    b: RecB;
    c: RecC;

    init() {
        self.a = RecA{ val:1 };
        self.b = RecB{ val: self.a };
        self.c = RecC{ val: self.b };
    }
}