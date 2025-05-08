struct OuterMost {
    str: String;
    mid: Middle;
}

struct Middle {
    val: Int;
    leaf: Leaf;
}

struct Leaf {
    b: Bool;
    c: String?;
}

contract MultiCompositeTower {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            str: "outer",
            mid: Middle{
                val: 123,
                leaf: Leaf{
                    b: true,
                    c: null
                }
            }
        };
    }
}
