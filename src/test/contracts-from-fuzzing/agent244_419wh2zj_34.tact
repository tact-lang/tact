// Nested optional on multiple levels with null at leaf

struct Leaf {
    x: Int?;
}

struct Middle {
    leaf: Leaf?;
}

contract MultiNullNestedOpt {
    data: Middle?;

    init() {
        self.data = null;
    }
}