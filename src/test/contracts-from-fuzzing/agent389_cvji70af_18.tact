struct InnerOpt {
    a: Int?;
    b: Bool?;
}

contract NullableEmbedded {
    x: InnerOpt?;

    init() {
        self.x = null;
    }
}