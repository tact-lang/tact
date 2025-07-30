struct InnerOpt {
    a: Int?;
    b: Bool?;
}

struct HigherOpt {
    x: InnerOpt?;
    y: Int;
}

contract OptInsideOpt {
    v: HigherOpt;

    init() {
        self.v = HigherOpt{ x: null, y:42 };
    }
}