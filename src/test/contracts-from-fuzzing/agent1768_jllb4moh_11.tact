struct Rec {
    x: Int = 1;
}

struct Mid {
    rec1: Rec;
    rec2: Rec;
}

contract TestContract {
    m1: Mid;
    m2: Mid;

    init() {
        self.m1 = Mid{ rec1: Rec{ x: 10 }, rec2: Rec{ x: 20 } };
        self.m2 = Mid{ rec1: Rec{ x: 30 }, rec2: Rec{ x: 40 } };
    }

    receive() {
        self.m1.rec1.x = 100;
        self.m2.rec2.x = 200;
    }
}