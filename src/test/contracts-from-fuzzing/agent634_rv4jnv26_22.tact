// Nested structs with multiple layers, optional inner optional, default in parent
struct Leaf {
    v: Int?;
}

struct Mid {
    leaf: Leaf?;
}

struct Wrapper {
    m: Mid = Mid{leaf: null};
    label: String = "lbl";
}

contract OptDefaultNesting {
    w: Wrapper;

    init() {
        self.w = Wrapper{};
    }
}