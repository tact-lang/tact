struct L1 { a:Int = 1 }
struct L2 { l1:L1 = L1{} }
struct L3 { l2:L2 = L2{} }
struct L4 { l3:L3 = L3{} }
struct L5 { l4:L4 = L4{} }
struct L6 { l5:L5 = L5{} }
struct L7 { l6:L6 = L6{} }

contract Test {
    deep: L7;
    init() {
        self.deep = L7{};
    }
}