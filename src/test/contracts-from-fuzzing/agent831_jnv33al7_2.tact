struct DeeplyNested {
    l1: Int;
    l2: Int;
    inner: InnerMost;
}

struct SecondLayer {
    info: DeeplyNested;
}

contract DeepNestContract {
    item: SecondLayer;
    init() {
        self.item = SecondLayer{
            info: DeeplyNested{
                l1: 1,
                l2: 2,
                inner: InnerMost{ a: 3 }
            }
        };
    }
}

struct InnerMost {
    a: Int;
}