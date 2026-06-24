struct DeepNest {
    level1: Int;
    level2: Int?;
    level3: Int;
    level4: Int?;
}

struct TopLevel {
    a: Int;
    b: DeepNest;
    c: Int?;
}

contract Fuzz {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            a: 1,
            b: DeepNest{
                level1: 10,
                level2: null,
                level3: 30,
                level4: null
            },
            c: null
        };
    }
}