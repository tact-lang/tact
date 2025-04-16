struct Leaf {
    x: Int;
}

struct Middle {
    leaf: Leaf? = null;
}

contract TestC {
    m: Middle;

    init() {
        self.m = Middle{};
    }
}