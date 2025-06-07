struct OptionalLeaf {
    v1: Int?;
    v2: Bool?;
    v3: String?;
}

struct OptionalMid {
    left: OptionalLeaf?;
    right: OptionalLeaf?;
}

struct RootOptional {
    leftMid: OptionalMid?;
    rightMid: OptionalMid?;
}

contract OptionalNestTest {
    optNestedField: RootOptional;

    init() {
        self.optNestedField = RootOptional{
            leftMid: null,
            rightMid: null,
        };
    }
}
