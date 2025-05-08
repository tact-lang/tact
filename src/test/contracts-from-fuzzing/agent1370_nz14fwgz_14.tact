struct SuperNested {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
}

struct WrapA {
    s: SuperNested;
}

struct WrapB {
    ss: WrapA;
}

struct WrapC {
    sss: WrapB;
}

contract ExcessivelyDeep {
    deep: WrapC;

    init() {
        self.deep = WrapC{
            sss: WrapB{
                ss: WrapA{
                    s: SuperNested{
                        a: 10,
                        b: "test",
                        c: true,
                        d: null
                    }
                }
            }
        };
    }
}