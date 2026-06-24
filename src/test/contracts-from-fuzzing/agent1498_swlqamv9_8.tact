struct L3 {
    value: Int;
}

struct L2 {
    nested: L3;
}

struct L1 {
    nested: L2;
}

contract DeepNestChain {
    chain: L1;

    init() {
        self.chain = L1{
            nested: L2{
                nested: L3{
                    value: 777,
                }
            }
        };
    }
}