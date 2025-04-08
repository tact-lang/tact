struct Leaf {
    tail: Slice as remaining;
}

struct Middle {
    val: Int;
    leaf: Leaf;
}

struct Root {
    mid: Middle;
}

contract TestContract {
    data: Root;

    init() {
        self.data = Root{
            mid: Middle{
                val: 5,
                leaf: Leaf{
                    tail: emptyCell().asSlice()
                }
            }
        };
    }
}