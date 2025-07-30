struct Leaf { val: Int }
struct Node { left: Leaf; right: Leaf }
struct Root { node: Node }

contract TreeStorage {
    root: Root;

    init() {
        self.root = Root{
            node: Node{
                left: Leaf{ val:1 },
                right: Leaf{ val:2 }
            }
        };
    }
}
