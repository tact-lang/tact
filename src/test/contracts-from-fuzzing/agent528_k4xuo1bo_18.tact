struct OuterOpt {
    x: Int?;
    y: InnerOpt?;
}

struct InnerOpt {
    s: String?;
}

contract TestContract {
    oo: OuterOpt;
    init() {
        self.oo = OuterOpt{x: null, y: null};
    }
}