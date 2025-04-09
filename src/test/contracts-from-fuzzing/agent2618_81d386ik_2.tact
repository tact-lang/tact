struct DeepNest {
    level1: Int;
    inner: InnerLayer;
}

struct InnerLayer {
    a: Int?;
    b: Leaf;
}

struct Leaf {
    val: Int?;
}

contract DeepContract {
    nested: DeepNest;

    init() {
        self.nested = DeepNest{
            level1: 1,
            inner: InnerLayer{
                a: null,
                b: Leaf{ val: 42 }
            }
        };
    }
}