struct ChainStruct {
    s1: Int?;
    s2: Int?;
}

contract ChainOptional {
    f1: ChainStruct?;
    f2: ChainStruct?;

    init() {
        self.f1 = null;
        self.f2 = null;
    }

    receive() {
        self.f1 = ChainStruct{ s1: 1, s2: null };
    }
}