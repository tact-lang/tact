struct DeepOpt {
    level1: Int?;
    level2: Int?;
    level3: Int?;
}

contract Test {
    dopt: DeepOpt?;

    init() {
        self.dopt = DeepOpt{
            level1: null,
            level2: null,
            level3: null,
        };
    }
}