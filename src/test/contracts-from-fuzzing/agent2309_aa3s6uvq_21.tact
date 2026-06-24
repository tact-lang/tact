// a long chain of nested structs with mostly defaults and some non-default
struct Leaf {
    v: Int? = null;
}

struct Node5 {
    leaf: Leaf;
}
struct Node4 {
    next: Node5;
}
struct Node3 {
    next: Node4;
}
struct Node2 {
    next: Node3;
}
struct Node1 {
    next: Node2;
}

contract ChainDefaults {
    chain: Node1;

    init() {
        self.chain = Node1{
            next: Node2{
                next: Node3{
                    next: Node4{
                        next: Node5{
                            leaf: Leaf{}
                        }
                    }
                }
            }
        };
    }
}