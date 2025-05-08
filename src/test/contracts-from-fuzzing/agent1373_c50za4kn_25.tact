struct Leaf {
    a: Int?;
    b: Bool?;
}

struct Mid {
    leaf: Leaf;
}

struct Top {
    mid: Mid;
}

contract Test {
    foo: Top?;

    init() {
        self.foo = Top{
            mid: Mid{
                leaf: Leaf{
                    a: null,
                    b: null
                }
            }
        };
    }
}