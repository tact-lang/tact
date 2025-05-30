struct NestedEdge {
    inner: InnerEdge;
    flag: Bool;
}

struct InnerEdge {
    opt: Int?;
    s: String;
    b: Bool;
}

contract CE {
    ne: NestedEdge;

    init() {
        self.ne = NestedEdge{
            inner: InnerEdge{ opt:null, s:"x", b:true },
            flag: false
        };
    }
}