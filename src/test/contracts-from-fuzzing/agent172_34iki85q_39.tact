struct Node5 { val: Int; }
struct Node4 { next: Node5?; }
struct Node3 { next: Node4?; }
struct Node2 { next: Node3?; }
struct Node1 { next: Node2?; }

contract DeepOptionalChain {
    root: Node1;

    init() {
        self.root = Node1{
            next: Node2{
                next: Node3{
                    next: Node4{
                        next: Node5{
                            val: 123,
                        },
                    },
                },
            },
        };
    }
}