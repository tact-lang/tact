struct L3 { flag: Bool?; }
struct L2 { l3: L3?; }
struct L1 { l2: L2?; }

contract UltraDeepOpt {
    l1: L1?;

    init() {
        self.l1 = null;
    }
}