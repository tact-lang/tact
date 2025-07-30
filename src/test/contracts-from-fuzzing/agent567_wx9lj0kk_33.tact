// test optional struct with optional inside, all null at constructor init
struct Leaf {
    num: Int?;
}

struct Mid {
    leaf: Leaf?;
}

contract NullInit {
    val: Mid?;
    init() {
        self.val = null;
    }
}
