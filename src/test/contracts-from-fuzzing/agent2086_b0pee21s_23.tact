struct L1 {
    val: Int;
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
struct L5 {
    l4: L4;
}
struct L6 {
    l5: L5;
}
struct L7 {
    l6: L6;
}
struct L8 {
    l7: L7;
}

contract DeepEightNest {
    v: L8;

    init() {
        self.v = L8{
            l7: L7{
                l6: L6{
                    l5: L5{
                        l4: L4{
                            l3: L3{
                                l2: L2{
                                    l1: L1{ val:987 }
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}