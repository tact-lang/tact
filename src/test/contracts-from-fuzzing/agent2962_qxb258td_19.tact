struct Leaf {
    val: Int?;
}

struct Inner {
    leaf: Leaf?;
}

contract OptInOpt {
    data: Inner?;

    init() {
        self.data = null;
    }
}