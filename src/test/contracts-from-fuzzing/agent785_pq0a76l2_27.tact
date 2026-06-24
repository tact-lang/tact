// contract with very deeply nested optional fields inside structs
struct Leaf {
    val: Int?;
}

struct Node {
    child: Leaf?;
}

struct Root {
    node: Node?;
}

contract DeepOpt {
    data: Root?;
    init() {
        self.data = Root{
            node: Node{
                child: Leaf{
                    val: 42
                }
            }
        };
    }
}
