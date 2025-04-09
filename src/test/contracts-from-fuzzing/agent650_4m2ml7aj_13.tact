// Struct with deeply nested optional fields
struct Leaf {
    value: Int?;
}

struct Middle {
    leafLeft: Leaf?;
    leafRight: Leaf?;
}

struct Root {
    mid1: Middle?;
    mid2: Middle?;
}

contract TestContract {
    root: Root;

    init() {
        self.root = Root{
            mid1: null,
            mid2: null
        };
    }
}
