// nested optional struct chain with bottom null
struct L3 { v: Int?; }
struct L2 { l3: L3?; }
struct L1 { l2: L2?; }

contract TestContract {
    opt: L1?;

    init() {
        self.opt = L1{ l2: null };
    }
}