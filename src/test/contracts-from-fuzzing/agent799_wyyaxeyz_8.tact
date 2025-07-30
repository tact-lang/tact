struct Innermost {
    f: Int;
}

struct L3 {
    nest: Innermost;
}

struct L2 {
    nest: L3;
}

struct L1 {
    nest: L2;
}

contract DeepChain {
    top: L1;
    init() {
        self.top = L1{
            nest: L2{
                nest: L3{
                    nest: Innermost{ f: 42 }
                }
            }
        };
    }
}