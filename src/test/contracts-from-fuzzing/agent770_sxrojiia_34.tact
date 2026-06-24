struct Leaf {
    num: Int;
}

struct Middle {
    leaf1: Leaf?;
    leaf2: Leaf?;
    optInt: Int?;
}

contract TestContract {
    val: Middle;

    init() {
        self.val = Middle{
            leaf1: null,
            leaf2: null,
            optInt: null
        };
    }
}