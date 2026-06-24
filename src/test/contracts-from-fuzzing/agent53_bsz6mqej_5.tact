struct L0 { value: Int; }
struct L1 { l0: L0; }
struct L2 { l1: L1; }
struct L3 { l2: L2; }
struct L4 { l3: L3; }
struct L5 { l4: L4; }
struct L6 { l5: L5; }
struct L7 { l6: L6; }
struct L8 { l7: L7; }
struct L9 { l8: L8; }

contract TestDeepChain {
    receive() {
        let d: L9 = L9{
            l8: L8{
                l7: L7{
                    l6: L6{
                        l5: L5{
                            l4: L4{
                                l3: L3{
                                    l2: L2{
                                        l1: L1{
                                            l0: L0{
                                                value: 999
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
        return;
    }
}
