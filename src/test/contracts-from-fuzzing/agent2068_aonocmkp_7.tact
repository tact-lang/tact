struct Alpha {
    i1: Int;
    nested: Beta;
}

struct Beta {
    s1: String;
    inside: Gamma;
}

struct Gamma {
    flag: Bool;
    opt: Int?;
}

contract NestedComplex {
    data: Alpha;

    init() {
        self.data = Alpha{
            i1: 1,
            nested: Beta{
                s1: "s",
                inside: Gamma{flag:true,opt:null}
            }
        };
    }
}