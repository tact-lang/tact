struct Node4 { val: Int?; }
struct Node3 { next: Node4?; }
struct Node2 { next: Node3?; }
struct Node1 { next: Node2?; }

contract Test {
    root: Node1;

    init() {
        self.root = Node1{
            next: Node2{
                next: Node3{
                    next: null  // critical: break chain explicitly here
                }
            }
        };
    }
}