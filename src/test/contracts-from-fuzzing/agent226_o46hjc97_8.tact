struct OptBoolNested {
    inner: Int?;
    flag: Bool?;
}

struct ManyNested {
    a: OptBoolNested;
    b: OptBoolNested;
    c: OptBoolNested;
}

contract ManyNestedOpts {
    n: ManyNested;

    init() {
        self.n = ManyNested{
            a: OptBoolNested{ inner:null, flag:true },
            b: OptBoolNested{ inner:5, flag:null },
            c: OptBoolNested{ inner:null, flag:null }
        };
    }
}
