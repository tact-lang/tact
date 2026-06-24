struct DeepNest {
    l1: L1;
}

struct L1 {
    l2: L2?;
}

struct L2 {
    l3: L3?;
}

struct L3 {
    x: Int;
    y: Bool;
}

contract DeepNestContract {
    field: DeepNest;
    
    init() {
        self.field = DeepNest{
            l1: L1{
                l2: L2{
                    l3: L3{
                        x: 42,
                        y: true,
                    },
                },
            },
        };
    }
}