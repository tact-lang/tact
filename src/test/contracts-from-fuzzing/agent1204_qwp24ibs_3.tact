// testing optional of struct with optional fields
struct Leaf {
    val: Int?;
}

struct Node {
    leaf: Leaf?;
}

contract OptOptStruct {
    data: Node?;

    init() {
        self.data = null;
    }
}