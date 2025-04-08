struct OptionalNesting {
    level1: Int?;
    level2: Int?;
    level3: Int?;
    level4: Int?;
    level5: Int?;
}

contract ManyOptionals {
    s: OptionalNesting;

    init() {
        self.s = OptionalNesting{
            level1:null, level2:null, level3:null, level4:null, level5:null
        };
    }
}