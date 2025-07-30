// Large deeply nested optional struct with some defaults
struct Leaf { val:Int?; }
struct Node1 { child:Leaf?; }
struct Node2 { child:Node1?; }
struct Node3 { child:Node2?; }

contract DeepOptionalTree {
    root: Node3;

    init() {
        self.root = Node3{child:null};
    }
}