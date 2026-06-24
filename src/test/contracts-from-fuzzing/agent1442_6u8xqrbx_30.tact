// deep nested 4 levels
struct L4 { x:Int; }
struct L3 { l4:L4; }
struct L2 { l3:L3; }
struct L1 { l2:L2; }

contract TestContract {
  root: L1;
  init() { self.root=L1{l2:L2{l3:L3{l4:L4{x:5}}}}; }
}