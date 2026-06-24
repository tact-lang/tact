struct Leaf {
    foo: Int;
    bar: Bool?;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct Tree {
    root: Branch;
    flag: Bool?;
}

contract TestContract(
    state: Tree
) {
    receive() {
        let _ = self.state;
    }
}