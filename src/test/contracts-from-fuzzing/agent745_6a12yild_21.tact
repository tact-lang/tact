struct OptDeep {
    level1: Int?;
    level2: Int?;
    level3: Int?;
    level4: Int?;
    level5: Int?;
}

contract ManyOptionals {
    opts: OptDeep;

    init() {
        self.opts = OptDeep{
            level1: null,
            level2: null,
            level3: null,
            level4: null,
            level5: null
        };
    }
}