struct ThreeLevelNested {
    x: Int;
    y: Bool?;
}

struct SecondLevel {
    a: Int;
    nested: ThreeLevelNested;
}

struct TopLevel {
    b: Bool;
    nested: SecondLevel;
}

contract DeepThreeLevel {
    storage: TopLevel;

    init() {
        self.storage = TopLevel{
            b: true,
            nested: SecondLevel{
                a: -1,
                nested: ThreeLevelNested{
                    x: 5,
                    y: null
                }
            }
        };
    }
}
