struct Leaf {
    val: Int?;
}

struct Middle {
    leaf: Leaf?;
}

contract TopMost {
    storage: Middle? = null;

    init() {
        self.storage = null;
    }
}