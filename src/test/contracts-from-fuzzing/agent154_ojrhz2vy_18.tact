struct LeafA { val: Int; }
struct LeafB { val: Bool; }
struct Node1 { a: LeafA; b: LeafB; }
struct Node2 { x: Node1; y: Node1; }

contract TreeStructStorage {
    node: Node2;

    init() {
        self.node = Node2{
            x: Node1{ a: LeafA{val:1}, b: LeafB{val:true} },
            y: Node1{ a: LeafA{val:2}, b: LeafB{val:false} }
        };
    }
}