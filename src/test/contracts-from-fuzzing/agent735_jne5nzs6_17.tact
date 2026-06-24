struct Leaf {
    value: Int;
}

struct Mid {
    leaf: Leaf?;
}

struct Root {
    mid: Mid?;
}

contract SparseNestedOptionals {
    data: Root;

    init() {
        self.data = Root{
            mid: Mid{
                leaf: Leaf{
                    value: 777,
                },
            },
        };
    }
}
