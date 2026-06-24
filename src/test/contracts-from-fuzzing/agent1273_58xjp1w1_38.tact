struct L5 { val: Int; }
struct L4 { l5: L5; }
struct L3 { l4: L4; }
struct L2 { l3: L3; }
struct L1 { l2: L2; }

contract DeepNest5 {
    top: L1;

    init() {
        self.top = L1{l2: L2{l3: L3{l4: L4{l5: L5{val:123}}}}};
    }
}