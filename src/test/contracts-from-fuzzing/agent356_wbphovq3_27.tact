struct SDeep {
    a: Int?;
    b: String?;
}

struct SOuter {
    s: SDeep?;
}

contract OuterOpt {
    s: SOuter;

    init() {
        self.s = SOuter{
            s: null
        };
    }
}