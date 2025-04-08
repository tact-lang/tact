struct RecursiveOpt {
    a: Int?;
    b: RecursiveInner?;
}

struct RecursiveInner {
    c: Bool?;
    d: RecursiveLeaf?;
}

struct RecursiveLeaf {
    e: Int?;
    f: String?;
}

contract RecOptContract {
    v: RecursiveOpt;

    init() {
        self.v = RecursiveOpt{
            a:null,
            b:null
        };
    }
}