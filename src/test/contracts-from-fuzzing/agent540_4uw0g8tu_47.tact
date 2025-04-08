struct L3 { v: Int? = null; }
struct L2 { l3: L3? = null; }
struct L1 { l2: L2? = null; }

contract MultiChain {
    c1: L1? = null;
    c2: L2? = null;
    c3: L3? = null;

    init() {
        self.c1 = null;
        self.c2 = null;
        self.c3 = null;
    }
}