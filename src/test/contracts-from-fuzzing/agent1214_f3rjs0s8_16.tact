struct TripleOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionContainers {
    t1: TripleOpt;
    t2: TripleOpt;
    init() {
        self.t1 = TripleOpt{ a: null, b: null, c: null };
        self.t2 = TripleOpt{ a: 5, b: true, c: "done" };
    }
}