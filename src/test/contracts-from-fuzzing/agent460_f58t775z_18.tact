struct Leaf { val: Int }
struct Node {
  left: Leaf?;
  right: Leaf?;
}

contract TreeContract {
    root: Node = Node{
        left: null,
        right: null
    };

    init() {
        self.root = Node{
            left: Leaf{ val: 1 },
            right: Leaf{ val: 2 }
        };
    }
}
