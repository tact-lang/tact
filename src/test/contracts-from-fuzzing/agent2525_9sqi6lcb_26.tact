// Contract with very deep nested structs 4 levels deep

struct L4 { val: Int; }
struct L3 { deep: L4; }
struct L2 { deep: L3; }
struct L1 { deep: L2; }

contract DeepNest {
    val: L1;
    init() {
        self.val = L1{deep: L2{deep: L3{deep: L4{val:123}}}};
    }
}