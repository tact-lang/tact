struct Leaf {
    x: Int as uint32;
    y: Int as int64;
}

struct Mid {
    leaf: Leaf;
    flag: Bool;
}

contract SerialHintNest {
    store: Mid = Mid{ leaf: Leaf{ x:1, y:-1 }, flag: true };

    init() {
        self.store = Mid{ leaf: Leaf{ x:123456, y:-987654321 }, flag:false };
    }
}