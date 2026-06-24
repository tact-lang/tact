struct Leaf {
    x: Int?; y: Int;
}
struct Mid {
    leaf1: Leaf;
    leaf2: Leaf?;
}
struct Root {
    mid1: Mid?;
    mid2: Mid;
}

contract DeepStorage {
    data: Root;

    init() {
        self.data = Root{
            mid1: null,
            mid2: Mid{
                leaf1: Leaf{x: null, y: 8},
                leaf2: Leaf{x: 5, y: 9}
            }
        };
    }
}