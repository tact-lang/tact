struct DeepOptional {
    level1: Int?;
    level2: Int?;
    level3: Int?;
}

contract ChainOpt {
    val: DeepOptional;

    init() {
        self.val = DeepOptional{
            level1: null,
            level2: 2,
            level3: 3
        };
    }
}