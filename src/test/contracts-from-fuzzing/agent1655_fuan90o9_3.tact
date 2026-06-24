struct DeepNested {
    level1: Int;
    next: DeepNestedOpt?;
}

struct DeepNestedOpt {
    level2: Int;
    next: DeepNestedOpt2?;
}

struct DeepNestedOpt2 {
    level3: Int;
}

contract DeepNestContract {
    root: DeepNested;

    init() {
        self.root = DeepNested{
            level1: 1,
            next: DeepNestedOpt{
                level2: 2,
                next: DeepNestedOpt2{
                    level3: 3,
                }
            }
        };
    }
}
