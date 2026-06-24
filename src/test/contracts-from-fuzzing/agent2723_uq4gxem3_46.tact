struct SOpt {
    s: Int?;
}

contract DeepOptionals {
    o1: SOpt?;
    o2: SOpt?;
    init() {
        self.o1 = null;
        self.o2 = SOpt{ s: null };
    }
}