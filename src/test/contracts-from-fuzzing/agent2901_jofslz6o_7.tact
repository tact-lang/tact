struct InnerMost {
    a: Int;
}

struct InnerOpt {
    v: Int?;
    d: InnerMost;
}

struct Top {
    o: InnerOpt?;
    f: Bool;
}

contract Test {
    x: Top;

    init() {
        self.x = Top{o:null, f:false};
    }
}