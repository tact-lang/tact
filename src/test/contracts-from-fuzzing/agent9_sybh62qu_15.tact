struct Leaf { x: Int }

struct Node1 { a: Leaf }
struct Node2 { b: Node1 }
struct Node3 { c: Node2 }
struct Node4 { d: Node3 }
struct Node5 { e: Node4 }

contract DeepTreeStorage {
    val: Node5;
    init() {
        self.val = Node5{
            e: Node4{
                d: Node3{
                    c: Node2{
                        b: Node1{
                            a: Leaf{ x: 100 }
                        }
                    }
                }
            }
        };
    }
}