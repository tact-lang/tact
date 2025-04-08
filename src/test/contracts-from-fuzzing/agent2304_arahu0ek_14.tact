struct ComplexLeaf {
    x: Int;
    y: String?;
    z: Bool;
}

struct Node {
    left: ComplexLeaf;
    right: ComplexLeaf;
}

contract TreeContract {
    root: Node;
    init() {
        self.root = Node{
            left: ComplexLeaf{x:1,y:null,z:true},
            right: ComplexLeaf{x:2,y: "hi",z:false}
        };
    }
}