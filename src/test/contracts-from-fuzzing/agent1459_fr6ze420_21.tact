// optional struct containing deeply nested struct with optionals and defaults
struct Leaf {
    val: Int? = null;
    txt: String = "";
}

struct Middle {
    leaf: Leaf;
}

struct Root {
    mid: Middle;
}

contract OptWithNestedDefaults {
    root: Root?;

    init() {
        self.root = null;
    }
}