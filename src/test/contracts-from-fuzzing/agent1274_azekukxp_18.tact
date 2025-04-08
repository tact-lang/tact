struct Top {
    a: Int;
    b: Middle;
}

struct Middle {
    c: Int?;
    d: Leaf;
}

struct Leaf {
    e: Int;
    f: Bool?;
}

contract NestedManyOptional {
    root: Top;

    init() {
        self.root = Top{
            a: 1,
            b: Middle{
                c: null,
                d: Leaf{
                    e: 5,
                    f: null,
                }
            }
        };
    }
}