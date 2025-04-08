struct OptionalLeaf {
    x: Int?;
}

struct MiddleLayer {
    leaf: OptionalLeaf?;
}

struct RootLayer {
    m: MiddleLayer?;
}

contract NullAtEveryLevel {
    val: RootLayer?;

    init() {
        self.val = null;
    }
}