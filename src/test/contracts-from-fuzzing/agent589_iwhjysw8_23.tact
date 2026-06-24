// Edge: test nested struct with optional struct with defaults deep inside
struct Leaf {
    strVal: String? = null;
    intVal: Int? = null;
}

struct Middle {
    leaf: Leaf? = null;
}

struct Root {
    mid: Middle? = null;
}

contract OptDefaultDeep {
    r: Root;

    init() {
        self.r = Root{};
    }
}
