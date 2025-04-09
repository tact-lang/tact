struct Leaf {
    x: Int? = null;
}

struct Stem {
    leaf: Leaf;
}

contract DefOptInParam(
    root: Stem
) {
    receive() {
        dump(self.root.leaf.x);
    }
}