struct InnerOpt {
    maybe: Int?;
}

struct OuterOpt {
    inn: InnerOpt?;
}

struct LevelOpt {
    out: OuterOpt?;
}

contract DoubleOpt {
    st: LevelOpt;

    init() {
        self.st = LevelOpt{ out: null };
    }
}