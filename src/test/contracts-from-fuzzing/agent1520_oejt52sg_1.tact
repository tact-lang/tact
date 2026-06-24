struct DeepNested {
    nested1: InnerLayer;
}

struct InnerLayer {
    nested2: InnerInnerLayer;
}

struct InnerInnerLayer {
    val1: Int;
    val2: Bool;
    val3: String?;
}

contract TestDeep {
    persistent: DeepNested;
    
    init() {
        self.persistent = DeepNested{
            nested1: InnerLayer{
                nested2: InnerInnerLayer{
                    val1: 7,
                    val2: true,
                    val3: null,
                },
            },
        };
    }
}
