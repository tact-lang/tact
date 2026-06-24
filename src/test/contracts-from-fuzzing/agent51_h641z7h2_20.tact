struct Rec1 {
    a: Int = 1;
}

struct Rec2 {
    rec: Rec1;
    b: Int = 2;
}

contract Test {
    r: Rec2;
    init() {
        self.r = Rec2{ rec: Rec1{ a: 1 }, b: 2 };
    }
}