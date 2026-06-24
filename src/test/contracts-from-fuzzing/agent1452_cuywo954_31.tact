struct InnerS {
    val: Int;
}

struct OuterS {
    inner: InnerS;
    opt: Bool?;
}

contract DefaultStruct {
    f: OuterS = OuterS{
        inner: InnerS{ val: 42 },
        opt: null
    };

    init() {
        self.f = OuterS{
            inner: InnerS{ val: 11 },
            opt: true
        };
    }
}
