// deeply nested optional struct with *initialized* deep chain
struct L5 { val: Int?; }
struct L4 { l5: L5?; }
struct L3 { l4: L4?; }
struct L2 { l3: L3?; }
struct L1 { l2: L2?; }

contract DeepSetOpt {
    l1: L1?;

    init() {
        self.l1 = L1{ l2: L2{ l3: L3{ l4: L4{ l5: L5{ val: 55 } } } } };
    }
}