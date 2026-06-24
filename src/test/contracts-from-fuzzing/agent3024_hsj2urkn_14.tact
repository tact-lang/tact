struct DeeplyOpt {
    a: Int?;
    b: InnerOpt?;
}

struct InnerOpt {
    c: String?;
    d: Bool?;
}

contract NestedOptStruct {
    st: DeeplyOpt;

    init() {
        self.st = DeeplyOpt{a: null, b: InnerOpt{c:null, d:true}};
    }
}
