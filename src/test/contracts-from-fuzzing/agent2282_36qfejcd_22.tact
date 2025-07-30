struct NestedOpts {
    a: Int?;
    b: Bool?;
    c: InnerStruct?;
}

struct InnerStruct {
    d: Int?;
    e: String?;
}

contract Test21 {
    s: NestedOpts;

    init() {
        self.s = NestedOpts{
            a: null,
            b: null,
            c: InnerStruct{ d:null, e:null }
        };
    }
}