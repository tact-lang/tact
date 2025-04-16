struct OuterOpt {
    s: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: String?;
}

contract OptStructOpt {
    f: OuterOpt;

    init() {
        self.f = OuterOpt{ s: InnerOpt{ x: null, y: null } };
    }
}