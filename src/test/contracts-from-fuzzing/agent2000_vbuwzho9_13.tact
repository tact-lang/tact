struct Leaf {
    x: Int?;
    y: Bool?;
}
struct Middle {
    l1: Leaf;
    l2: Leaf;
}
struct Top {
    m1: Middle?;
    m2: Middle;
}

contract ComboOptional {
    val: Top;
    init() {
        self.val = Top{ m1: null, m2: Middle{ l1: Leaf{ x: null, y: null }, l2: Leaf{ x: null, y: null } } };
    }
}