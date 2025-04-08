struct ManyOpt {
    v1: Int?;
    v2: Int?;
    v3: Int?;
    v4: Int?;
}

contract OnlyManyOpt {
    opts: ManyOpt;

    init() {
        self.opts = ManyOpt{
            v1: 1,
            v2: 2,
            v3: 3,
            v4: 4
        };
    }
}