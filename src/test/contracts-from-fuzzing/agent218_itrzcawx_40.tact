struct InnerMost {
    deepFlag: Bool;
}

struct InnerLayer2 {
    innerMost: InnerMost;
}

struct InnerLayer1 {
    layer2: InnerLayer2;
}

contract DeepFlags {
    flagHolder: InnerLayer1;

    init() {
        self.flagHolder = InnerLayer1{
            layer2: InnerLayer2{
                innerMost: InnerMost{
                    deepFlag: true
                }
            }
        };
    }
}