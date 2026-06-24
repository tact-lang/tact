struct DeepNested {
    nested1: InnerLayer;
}

struct InnerLayer {
    nested2: InnerMost;
}

struct InnerMost {
    val: Int;
    flag: Bool;
}

contract TestContract {
    storage: DeepNested;

    init() {
        self.storage = DeepNested{
            nested1: InnerLayer{
                nested2: InnerMost{
                    val: 777,
                    flag: true
                }
            }
        };
    }
}