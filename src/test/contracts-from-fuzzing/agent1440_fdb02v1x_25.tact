struct TripleNest {
    i: Int;
    mid: MiddleLayer;
}

struct MiddleLayer {
    flag: Bool;
    inner: InnerLayer;
}

struct InnerLayer {
    s: String;
    opt: Int?;
}

contract TripleNestStore {
    data: TripleNest;

    init() {
        self.data = TripleNest{
            i: 5,
            mid: MiddleLayer{
                flag: true,
                inner: InnerLayer{ s: "X", opt: null }
            }
        };
    }
}