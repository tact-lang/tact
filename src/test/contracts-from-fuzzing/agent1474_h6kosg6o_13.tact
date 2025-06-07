struct OptionInt {
    x: Int?;
}

struct OptionStr {
    s: String?;
}

struct Comb {
    a: OptionInt;
    b: OptionStr;
}

contract OptMix {
    v: Comb;

    init() {
        self.v = Comb{
            a: OptionInt{ x: null },
            b: OptionStr{ s: null }
        };
    }
}
