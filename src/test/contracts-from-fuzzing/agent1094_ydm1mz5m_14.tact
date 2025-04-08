struct X {
    a: Int;
}

contract DoublePersistent {
    data1: X;
    data2: X;
    init() {
        self.data1 = X{a: 42};
        self.data2 = X{a: 43};
    }
}