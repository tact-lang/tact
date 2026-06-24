struct Rec1 { v: Int; }
struct Rec2 { v: Int; }

contract RepeatStructs {
    s1: Rec1;
    s2: Rec2;

    init() {
        self.s1 = Rec1{ v: 1 };
        self.s2 = Rec2{ v: 2 };
    }
}
