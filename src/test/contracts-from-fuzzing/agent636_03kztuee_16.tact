struct Rec1 {
    f1: Int;
}

struct Rec2 {
    r1: Rec1;
}

struct Rec3 {
    r2: Rec2;
}

struct Rec4 {
    r3: Rec3;
}

contract DeepChain4 {
    chain: Rec4;

    init() {
        self.chain = Rec4{ r3: Rec3{ r2: Rec2{ r1: Rec1{ f1: 33 } } } };
    }
}
