struct Deep {
    n1: Int;
    s1: String;
    sub: SubDeep;
}

struct SubDeep {
    n2: Int;
    opt: Bool?;
    subsub: SubSubDeep;
}

struct SubSubDeep {
    n3: Int;
    s2: String;
    opt2: Int?;
}

contract DeepContract {
    d: Deep;

    init() {
        self.d = Deep{
            n1: 1,
            s1: "x",
            sub: SubDeep{
                n2: 2,
                opt: null,
                subsub: SubSubDeep{
                    n3:3,
                    s2:"y",
                    opt2:null
                }
            }
        };
    }
}
