struct Leaf {
    msg: String = "";
}

struct Stem {
    leaf: Leaf;
    s: String = "hi";
}

contract EmptyStrDefault {
    data: Stem;

    init() {
        self.data = Stem{
            leaf: Leaf{},
            s: "nonempty"
        };
    }
}