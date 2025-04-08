struct InnerS {
    num: Int;
}

struct MiddleS {
    inner: InnerS;
}

contract MultipleStructFields {
    f1: InnerS;
    f2: MiddleS;

    init() {
        self.f1 = InnerS{num:1};
        self.f2 = MiddleS{inner:InnerS{num:2}};
    }
}