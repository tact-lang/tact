struct InnerParam {
    x: Int;
    y: Int?;
}

contract InitOnly {
    nested: InnerParam;

    init() {
        self.nested = InnerParam{ x: 5, y: null };
    }
}