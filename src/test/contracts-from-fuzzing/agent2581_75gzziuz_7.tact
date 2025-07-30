struct L0 { v: Int; }
struct L1 { v: L0; }
struct L2 { v: L1; }
struct L3 { v: L2; }
struct L4 { v: L3; }
struct L5 { v: L4; }

contract Depth6 {
    val: L5;

    init() {
        self.val = L5{ v: L4{ v: L3{ v: L2{ v: L1{ v: L0{ v: 42 }}}}}};
    }
}
