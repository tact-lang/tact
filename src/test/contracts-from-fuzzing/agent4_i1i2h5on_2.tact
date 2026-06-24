struct DeepNest {
    level1: Int;
    level2: Bool;
    deepInner: InnerOpt;
}

struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    nested: DeepNest;

    init() {
        self.nested = DeepNest{
            level1: 5,
            level2: false,
            deepInner: InnerOpt {
                x: 777,
                y: null
            }
        };
    }
}
