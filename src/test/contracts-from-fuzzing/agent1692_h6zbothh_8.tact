struct L3 {
    leaf: Int;
}

struct L2 {
    child: L3;
}

struct L1 {
    nested: L2;
}

contract DeepNestedChain {
    field: L1;

    init() {
        self.field = L1{
            nested: L2{
                child: L3{
                    leaf: 42
                }
            }
        };
    }
}