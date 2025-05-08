struct Leaf {
    tail: Slice as remaining;
}

struct Mid {
    a: Int = 1;
    leaf: Leaf?;
}

struct Root {
    mid: Mid?;
}

contract TestContract {
    data: Root?;

    init() {
        self.data = Root{
            mid: Mid{
                a: 5,
                leaf: Leaf{
                    tail: emptyCell().asSlice()
                }
            }
        };
    }
}