struct Leaf {
    val: Int;
}

struct Middle {
    leaf: Leaf?;
}

contract TestContract {
    midOpt: Middle?;

    init() {
        self.midOpt = null;
    }
}