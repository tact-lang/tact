struct L1 {
    A: Int;
}

struct L2 {
    L1: L1;
}

struct L3 {
    L2: L2;
}

struct L4 {
    L3: L3;
}

struct L5 {
    L4: L4;
}

contract TestDeepNest {
    receive() {
        let n: L5 = L5 {
            L4: L4 {
                L3: L3 {
                    L2: L2 { L1: L1 { A: 42 } }
                }
            }
        };
    }
}
