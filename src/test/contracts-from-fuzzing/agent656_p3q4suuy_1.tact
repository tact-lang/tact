struct DeepNested {
    inner1: InnerNest;
}

struct InnerNest {
    inner2: InnerMost;
}

struct InnerMost {
    flag: Bool;
    number: Int;
    text: String;
}

contract Test {
    nested: DeepNested;
    
    init() {
        self.nested = DeepNested{
            inner1: InnerNest{
                inner2: InnerMost{
                    flag: true,
                    number: 42,
                    text: "deep"
                }
            }
        };
    }
}