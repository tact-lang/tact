struct Leaf {
    flag: Bool;
}

struct Mid {
    leaf: Leaf?;
}

struct Top {
    mid: Mid?;
}

contract NullableNested {
    nested: Top?;

    init() {
        self.nested = Top{
            mid: Mid{
                leaf: Leaf{
                    flag: true,
                },
            },
        };
    }
}