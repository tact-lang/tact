struct Leaf1 { x: Int }
struct Leaf2 { y: Bool }
struct Node1 { l1: Leaf1 }
struct Node2 { l2: Leaf2 }

struct WholeTree {
    n1: Node1;
    n2: Node2;
}

contract Test35 {
    wt: WholeTree;
    init() {
        self.wt = WholeTree{
            n1:Node1{l1:Leaf1{x:42}},
            n2:Node2{l2:Leaf2{y:true}}
        };
    }
}
