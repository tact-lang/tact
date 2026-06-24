struct Leaf { val: Int; }

struct Node4 { leaf: Leaf?; }
struct Node3 { node4: Node4?; }
struct Node2 { node3: Node3?; }
struct Node1 { node2: Node2?; }

contract DeepNull {
    root: Node1;

    init() {
        self.root = Node1{
            node2: Node2{
                node3: Node3{
                    node4: Node4{
                        leaf: null
                    }
                }
            }
        };
    }
}
