// struct defaults with nested struct with defaults
struct Leaf {
    x: Int = 1;
    y: String = "y";
}

struct Branch {
    leaf: Leaf = Leaf{};
}

contract StructStructDefaults {
    branch: Branch;
    init() {
        self.branch = Branch{};
    }
}