// Nested optionals multiple levels deep with mixed optionals & defaults
struct LeafDef {
    id: Int?;
    txt: String = "d";
}

struct Branch {
    kid: LeafDef?;
    count: Int;
}

struct Root {
    b: Branch?;
    tag: Int;
}

contract Branches {
    tree: Root?;

    init() {
        self.tree = null;
    }
}