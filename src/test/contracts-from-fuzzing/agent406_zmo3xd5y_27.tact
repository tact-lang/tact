struct InnerS {
    a: Int;
}

contract MultiSameType {
    s1: InnerS;
    s2: InnerS;
    s3: InnerS;

    init() {
        self.s1 = InnerS{a:1};
        self.s2 = InnerS{a:2};
        self.s3 = InnerS{a:3};
    }
}