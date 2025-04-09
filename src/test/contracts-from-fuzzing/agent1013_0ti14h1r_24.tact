struct NestedOpt {
    inner: Int?;
    other: Bool?;
}

contract MixOpt {
    outerOpt: NestedOpt?;

    init() {
        self.outerOpt = null;
    }
}