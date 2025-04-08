struct Leaf { x: Int } 

struct Node1 { a: Leaf; }
struct Node2 { b: Node1; }
struct Node3 { c: Node2; }

contract DeepChain {
    chain: Node3;

    init() {
        self.chain = Node3{
            c: Node2{
                b: Node1{
                    a: Leaf{ x: 500 }
                }
            }
        };
    }
}
