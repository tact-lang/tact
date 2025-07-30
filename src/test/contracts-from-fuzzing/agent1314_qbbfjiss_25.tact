struct DiverseOpt {
    s: String?;
    x: Int?;
    b: Bool?;
}

contract DiverseOptional {
    v: DiverseOpt;

    init() {
        self.v = DiverseOpt{
            s: null,
            x: null,
            b: null,
        };
    }
}