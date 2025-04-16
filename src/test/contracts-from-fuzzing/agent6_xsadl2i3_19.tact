struct Wrap {
    a: Int;
}

contract MultiStructs {
    s1: Wrap;
    s2: Wrap;
    s3: Wrap;
    init() {
        self.s1 = Wrap{a: 1};
        self.s2 = Wrap{a: 2};
        self.s3 = Wrap{a: 3};
    }
}