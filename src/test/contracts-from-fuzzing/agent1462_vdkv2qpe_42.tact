// optional struct, whose optional nested struct contains explicitly defaulted null
struct Leaf {
    x: Int? = null;
}
struct MidLeaf {
    l: Leaf? = null;
}

contract DoubleDefOpt {
    f: MidLeaf?;
    init() {
        self.f = null;
    }
}