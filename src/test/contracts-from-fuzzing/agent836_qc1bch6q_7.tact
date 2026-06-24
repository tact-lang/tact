struct L1 { val: Int = 1; }
struct L2 { l1: L1?; }
struct L3 { l2: L2?; }
struct L4 { l3: L3?; }

contract DeepOptional {
    data: L4;
    init() {
        self.data = L4{ l3: null };
    }
}