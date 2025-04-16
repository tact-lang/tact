struct ManyNestedOpt {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

struct Wrap {
    anOpt: ManyNestedOpt?;
}

contract Test36 {
    s: Wrap;

    init() {
        self.s = Wrap{ anOpt: null };
    }
}
