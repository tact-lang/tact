struct MidDeep {
    a: Int;
    b: InnerLayer;
}

struct InnerLayer {
    c: String;
    d: InnerMost;
}

struct InnerMost {
    e: Int?
}

contract MidDeepContract {
    fld: MidDeep;

    init() {
        self.fld = MidDeep{
            a:1,
            b: InnerLayer{
                c:"x",
                d:InnerMost{ e:null }
            }
        };
    }
}