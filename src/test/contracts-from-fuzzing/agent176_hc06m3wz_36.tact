// Combining nested structs + optionals deeply chain

struct Leaf {
    f: Int?;
}

struct Mid {
    leaf: Leaf?;
}

struct Top {
    mid: Mid?;
}

contract CrazyNestedOptionals {
    chain: Top = Top{ mid: null };

    init() {
        self.chain = Top{
            mid: Mid{
                leaf: Leaf{
                    f: 17
                }
            }
        };
    }
}