struct L0 { a:Int; }
struct L1 { x:L0; }
struct L2 { y:L1; }
struct L3 { z:L2; }
struct L4 { w:L3; }

contract DeepTree {
    t: L4;

    init() {
        self.t = L4{ w:L3{z:L2{y:L1{x:L0{ a:55 } } } } };
    }
}
