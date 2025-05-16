struct ManyNested {
    l1: L1;
}

struct L1 {
    l2: L2;
}

struct L2 {
    l3: L3;
}

struct L3 {
    l4: L4;
}

struct L4 {
    val: Int;
}

contract TestContract {
    data: ManyNested;
    init() {
        self.data = ManyNested{
            l1: L1{
                l2: L2{
                    l3: L3{
                        l4: L4{
                            val: 1
                        }
                    }
                }
            }
        };
    }
}