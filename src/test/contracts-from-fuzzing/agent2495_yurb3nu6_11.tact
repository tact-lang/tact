struct L1 {
    a: Int;
}

struct L2 {
    b: L1;
}

struct L3 {
    c: L2;
}

struct L4 {
    d: L3;
}

contract DeeplyNestedLevel {
    val: L4;
    
    init() {
        self.val = L4{
            d: L3{
                c: L2{
                    b: L1{
                        a: 42
                    }
                }
            }
        };
    }
}