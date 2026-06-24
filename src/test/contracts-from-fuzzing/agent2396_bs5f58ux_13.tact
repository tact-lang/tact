struct FlatOpt {
    o1: Int?;
    o2: String?;
    o3: Bool?;
}

contract JustOpts {
    f: FlatOpt;

    init() {
        self.f = FlatOpt{
            o1: null,
            o2: null,
            o3: null
        };
    }
}