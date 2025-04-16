struct DeepNest {
    innermost: String;
}

struct MidNest {
    nested: DeepNest;
}

struct TopNest {
    wrapper: MidNest;
}

contract TestDeepNesting {
    stored: TopNest;

    init() {
        self.stored = TopNest{
            wrapper: MidNest{
                nested: DeepNest{
                    innermost: "hi"
                }
            }
        };
    }
}
