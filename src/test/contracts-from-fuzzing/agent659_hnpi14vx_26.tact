struct L5 { v: Int; }
struct L4 { l5: L5?; }
struct L3 { l4: L4?; }
struct L2 { l3: L3?; }
struct L1 { l2: L2?; }

contract TestContract {
    chain: L1?;

    init() {
        self.chain = null;
    }
}