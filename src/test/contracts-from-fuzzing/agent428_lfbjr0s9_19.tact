// nested optionals with optional persistent field
struct Leaf {
    id: Int;
}

struct Branch {
    leaf: Leaf?;
}

struct Tree {
    branch: Branch?;
}

contract TestContract {
    content: Tree?;

    init() {
        self.content = null;
    }
}