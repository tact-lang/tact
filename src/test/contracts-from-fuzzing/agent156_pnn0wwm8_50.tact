struct OptionalLeaf {
    s: String?;
    b: Bool?;
}

struct MiddleNest {
    nest: OptionalLeaf?;
}

contract NullLeafInNest {
    data: MiddleNest;

    init() {
        self.data = MiddleNest{ nest: null };
    }
}
