struct MiddleMost {
    val: Int?;
}

struct MiddleLayer {
    middle: MiddleMost?;
}

struct TopLayer {
    top: MiddleLayer?;
}

contract MultiLayerNulls {
    storage: TopLayer?;

    init() {
        self.storage = null;
    }
}