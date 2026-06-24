struct Leaf {
    x: Int?;
    y: Bool?;
}

struct Middle {
    l1: Leaf?;
    l2: Leaf?;
    s: String?;
}

contract DeepNull {
    m: Middle?;
    init() {
        self.m = null;
    }
    receive() {}
}