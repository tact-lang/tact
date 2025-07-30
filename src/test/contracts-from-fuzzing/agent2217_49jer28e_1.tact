struct DeepNest {
    x: Int;
    o1: Inner?;
}

struct Inner {
    y: Int;
    o2: InnerMost?;
}

struct InnerMost {
    z: Int;
}

contract Test {
    data: DeepNest;
    
    init() {
        self.data = DeepNest{
            x: 1,
            o1: Inner{
                y: 2,
                o2: InnerMost{
                    z: 3
                }
            }
        };
    }
}
