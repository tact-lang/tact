// Alternating layers of nested optionals and structs
struct L3 { val: Int }
struct L2 { l3: L3? }
struct L1 { l2: L2? }

contract AltNestedOpt {
    field: L1? = null;

    init() {
       self.field = L1{ l2:L2{ l3:L3{val:7} } };
    }
}