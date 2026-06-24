struct InnerOpt {
    x: Int?;
    y: Bool;
}

struct OuterOpt {
    z: InnerOpt?;
}

contract TestContract {
    oo: OuterOpt;

    init() {
        self.oo = OuterOpt{ z: null };
    }
}