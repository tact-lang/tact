struct InnerOpt {
    z: Int?;
}
struct DoubleOpt {
    y: InnerOpt?;
}
struct TripleOpt {
    x: DoubleOpt?;
}

contract TestContract {
    t: TripleOpt;

    init() {
        self.t = TripleOpt{ x: null };
    }
}