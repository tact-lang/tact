struct Leaf {
    z: Int? = 7;
}

struct Middle {
    leaf: Leaf?;
}

contract TestC {
    m: Middle;

    init() {
        self.m = Middle{ leaf: Leaf{} };
    }
}