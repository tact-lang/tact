struct Leaf {
    num: Int?;
}

struct Middle {
    leaf: Leaf?;
}

contract NestedDoubleNull {
    data: Middle;

    init() {
        self.data = Middle{
            leaf: Leaf{
                num: null
            }
        };
    }
}
