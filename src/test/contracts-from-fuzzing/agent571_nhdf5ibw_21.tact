struct Leaf {
    val: Int;
}

struct Middle {
    optLeaf: Leaf?;
}

struct Top {
    mid: Middle;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{mid: Middle{optLeaf: null}};
    }
}