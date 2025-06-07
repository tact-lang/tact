// focus deeply nested optional within nested struct
struct L1 { x: Int; }
struct L2 { l1: L1?; }
struct L3 { l2: L2; }

contract OptDeepMid {
    val: L3;
    init() {
        self.val = L3{
            l2: L2{ l1: null }
        };
    }
}
