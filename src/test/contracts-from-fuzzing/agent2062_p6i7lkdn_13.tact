struct NestedOpt {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract FieldOptInnerOpt {
    inner: NestedOpt?;
    init() { self.inner = null; }
}