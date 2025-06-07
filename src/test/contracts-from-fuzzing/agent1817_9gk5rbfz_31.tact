// Compose large nest of nested structs with defaulted inner values
struct Leaf { x: Int = 1; }
struct Middle {
    a: Leaf = Leaf{};
    b: Leaf = Leaf{};
    c: Leaf = Leaf{};
}
struct Root {
    m1: Middle = Middle{};
    m2: Middle = Middle{};
}

contract LargeDefaultsTree {
    r: Root;

    init() {
        self.r = Root{};
    }
}