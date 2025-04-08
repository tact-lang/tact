struct DeeplyNested {
    l1: L1;
}

struct L1 {
    l2: L2;
}

struct L2 {
    l3: L3;
}

struct L3 {
    value: Int;
}

contract DeepNestContract {
    deep: DeeplyNested;

    init() {
        self.deep = DeeplyNested{
            l1: L1{
                l2: L2{
                    l3: L3{
                        value: 123,
                    }
                }
            }
        };
    }
}