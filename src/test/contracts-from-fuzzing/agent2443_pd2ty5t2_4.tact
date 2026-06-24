struct L1 {
    a: Int;
}

struct L2 {
    l1: L1;
}

struct L3 {
    l2: L2;
}

struct L4 {
    l3: L3;
}

contract TestContract {
    deeplyNested: L4;
    init() {
        self.deeplyNested = L4{
            l3: L3{
                l2: L2{
                    l1: L1{a:42}
                }
            }
        };
    }
}