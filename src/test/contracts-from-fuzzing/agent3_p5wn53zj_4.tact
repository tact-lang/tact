struct L4 {
    Val: Int;
}

struct L3 {
    L4_: L4;
}

struct L2 {
    L3_: L3;
}

struct L1 {
    L2_: L2;
}

contract TestDeepChain {
    receive() {
        let d = L1 {
            L2_: L2 {
                L3_: L3 {
                    L4_: L4 { Val: 999 }
                }
            }
        };
        d.L2_.L3_.L4_.Val;
    }
}
