struct Rec1 {
    a: Int;
}

struct Rec2 {
    prev: Rec1;
}

struct Rec3 {
    before: Rec2;
}

struct Rec4 {
    old: Rec3;
}

contract PersistLastChain {
    s: Rec4;

    init() {
        self.s = Rec4{ old: Rec3 { before: Rec2 { prev: Rec1 { a: 42 } } } };
    }
}