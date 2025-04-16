struct L3 { val: Int; }
struct L2 { l3: L3; }
struct L1 { l2: L2; }

contract TestContract {
    nested: L1;

    init() {
        self.nested = L1{l2: L2{l3: L3{val: 7}}};
    }
}