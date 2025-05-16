struct Node1 { next: Int? }
struct Node2 { next: Node1 }
struct Node3 { next: Node2 }
struct Node4 { next: Node3 }

contract LinkedNested {
    head: Node4;

    init() {
        self.head = Node4{
            next: Node3{
                next: Node2{
                    next: Node1{
                        next: null
                    }
                }
            }
        };
    }
}