struct L4 {
    val: Int;
}

struct L3 {
    l4: L4;
}

struct L2 {
    l3: L3;
}

struct L1 {
    l2: L2;
}

contract Deep4Levels {
    nested: L1;

    init() {
        self.nested = L1{
            l2: L2{
                l3: L3{
                    l4: L4{
                        val: 1234
                    }
                }
            }
        };
    }
}