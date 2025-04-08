struct L3 { val: Int; }
struct L2 { l3: L3?; }
struct L1 { l2: L2?; }

contract TestContract {
    root: L1?;

    init() {
        self.root = null;
    }
}