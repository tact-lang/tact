struct Leaf {
    x: Int?;
    y: Cell?;
    z: String?;
}

struct Mid {
    leaf: Leaf?;
}

contract OptDeepCells {
    mid: Mid?;

    init() {
        self.mid = null;
    }
}