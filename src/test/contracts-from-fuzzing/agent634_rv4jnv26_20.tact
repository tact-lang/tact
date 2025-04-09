// push nested optional plus complex default chain
struct Leaf {
    data: Int? = null;
}

struct Mid {
    leaf: Leaf? = null;
    lbl: String = "mid";
}

struct Root {
    mid1: Mid = Mid{};
    mid2: Mid? = null;
}

contract CompDefaults {
    root: Root;

    init() {
        self.root = Root{};
    }
}