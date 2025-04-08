struct NestedOpt {
    a: Int?;
    b: InnerOpt?;
}

struct InnerOpt {
    c: Int?;
    d: Bool?;
}

contract Test {
    data: NestedOpt;
    init() {
        self.data = NestedOpt{ a:null, b:null };
    }
}