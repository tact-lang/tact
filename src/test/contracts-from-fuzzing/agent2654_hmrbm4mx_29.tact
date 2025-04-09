struct NestedOptOpt {
    a: Int?;
    b: String?;
}

struct OuterWrap {
    opt: NestedOptOpt?;
    flag: Bool;
}

contract OuterWithInnerOptOpt {
    o: OuterWrap;

    init() {
        self.o = OuterWrap{
            opt: null,
            flag: true
        };
    }
}