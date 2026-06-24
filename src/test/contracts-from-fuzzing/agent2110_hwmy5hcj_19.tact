// deeply nested struct with mostly defaults and optionals
struct Leaf {
    q: Int = 7;
}

struct Mid {
    x: Bool?;
    inner: Leaf = Leaf{};
}

struct Root {
    leaf_opt: Mid?;
}

contract DeepMixed {
    d: Root?;
    init() {
        self.d = null;
    }
}