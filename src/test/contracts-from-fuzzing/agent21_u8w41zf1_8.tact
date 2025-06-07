struct Mid {
    flag: Bool;
    leaf: Leaf;
}

struct Leaf {
    x: Int;
    yOpt: Int?;
}

contract NonTrivialOrder {
    f1: Mid;
    f2: Bool?;
    f3: Int;

    init() {
        self.f1 = Mid{flag:true, leaf: Leaf{x:7,yOpt:null}};
        self.f2 = null;
        self.f3 = 42;
    }

    receive() {}
}