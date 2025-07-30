struct SOpt {
    x: Int?;
}

contract OptionalChainFlat {
    o1: SOpt?;
    o2: SOpt?;
    o3: SOpt?;
    init() {
        self.o1 = SOpt{x: 1};
        self.o2 = null;
        self.o3 = SOpt{x: null};
    }
}