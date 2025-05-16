struct TopLevel1 {
    a: Int;
}

struct TopLevel2 {
    b: Bool;
}

contract MultiIndependent {
    t1: TopLevel1;
    t2: TopLevel2;

    init() {
        self.t1 = TopLevel1{ a: 123 };
        self.t2 = TopLevel2{ b: false };
    }
}