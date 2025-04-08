struct MixedNested {
    a: Int;
    b: Bool?;
    c: InnerA;
    d: InnerB;
}

struct InnerA {
    str: String?;
    intOpt: Int?;
}

struct InnerB {
    a: InnerA;
    optA: InnerA?;
    flag: Bool;
}

contract MixedFields {
    store: MixedNested;

    init() {
        self.store = MixedNested{
            a: 1,
            b: null,
            c: InnerA{str:null,intOpt:2},
            d: InnerB{
                a: InnerA{str:"x", intOpt:null},
                optA: null,
                flag: false
            }
        };
    }
}