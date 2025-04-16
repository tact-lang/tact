struct InnerS {
    x: Int;
    y: Bool?;
    s: String?;
}

struct MiddleS {
    inner: InnerS;
    z: Int;
}

struct OuterS {
    m: MiddleS;
    flag: Bool;
}

contract NestedManyFields {
    big: OuterS;

    init() {
        self.big = OuterS{
            m: MiddleS{
                inner: InnerS{ x:7, y:null, s:"hi" },
                z: 42
            },
            flag: true
        };
    }
}