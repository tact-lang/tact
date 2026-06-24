struct SOpt {
    s: Int?;
}

contract OptInPersistent {
    f1: Int?;
    f2: SOpt?;

    init() {
        self.f1 = null;
        self.f2 = null;
    }
}
