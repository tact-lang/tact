// optional struct nested inside a struct, inside another optional struct
struct Leaf {
    foo: Int?;
    bar: Bool;
}

struct Node {
    leaf: Leaf?;
    label: String;
}

contract TestContract {
    root: Node?;

    init() {
        self.root = null;
    }
}