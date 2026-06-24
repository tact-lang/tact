struct Mid {
    x1: Int?;
    x2: Bool?;
    x3: Address?;
    x4: Cell?;
    x5: Slice?;
    x6: String?;
}

struct LargeOpt {
    m1: Mid?;
    m2: Mid?;
    m3: Mid?;
}

contract OptNested {
    state: LargeOpt;
    init() {
        self.state = LargeOpt{
            m1: null,
            m2: null,
            m3: null,
        };
    }
}