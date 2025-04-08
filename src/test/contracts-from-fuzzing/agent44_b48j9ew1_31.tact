struct Chain {
    c1: Int;
    c2: Int?;
}

contract Optionals {
    s1: Chain?;
    s2: Chain?;

    init() {
        self.s1 = null;
        self.s2 = null;
    }

    receive() {
        self.s1 = Chain{ c1: 1, c2: null };
        self.s2 = Chain{ c1: 2, c2: 5 };
    }
}