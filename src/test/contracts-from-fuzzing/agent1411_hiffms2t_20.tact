// contract with deeply nested struct containing optional booleans
struct Leaf { flag: Bool? }
struct Node1 { leaf: Leaf }
struct Node2 { node: Node1 }
struct Node3 { node: Node2 }

contract TestContract {
    root: Node3;
    init() {
        self.root = Node3{
            node: Node2{
                node: Node1{
                    leaf: Leaf{flag: null}
                }
            }
        };
    }
}