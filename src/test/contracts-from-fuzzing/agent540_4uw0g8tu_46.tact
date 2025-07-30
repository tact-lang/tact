struct L5 { n: Int? = null; }
struct L4 { l5: L5? = null; }
struct L3 { l4: L4? = null; }
struct L2 { l3: L3? = null; }
struct L1 { l2: L2? = null; }

contract Extremity {
    s: L1? = null;

    init() {
        self.s = null;
    }
}