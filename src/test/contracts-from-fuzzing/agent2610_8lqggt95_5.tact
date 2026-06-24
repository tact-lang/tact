struct OptionalDeepNest {
    l1: L1?;
}

struct L1 {
    l2: L2?;
}

struct L2 {
    l3: L3?;
}

struct L3 {
    val: Int?;
}

contract TestContract {
    data: OptionalDeepNest;
    init() {
        self.data = OptionalDeepNest{
            l1: L1{
                l2: L2{
                    l3: L3{val: null}
                }
            }
        };
    }
}
