// Deep struct chain assigning some branches null
struct Node3 { d: Int?; }
struct Node2 { c: Node3?; }
struct Node1 { b: Node2?; }

contract NullBranch {
    root: Node1;

    init() {
        self.root = Node1{
            b: Node2{c: null}
        };
    }
}