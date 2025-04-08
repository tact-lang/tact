struct InnerMost {
    x: Int;
    y: String?;
}

struct Layer1 {
    inner: InnerMost;
}

struct Layer2 {
    l1: Layer1;
}

contract DeepNestNulls {
    l2: Layer2;

    init() {
        self.l2 = Layer2{
            l1: Layer1{
                inner: InnerMost{
                    x: 42,
                    y: null
                }
            }
        };
    }
}