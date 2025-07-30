struct DeepOptional {
    x: Int?;
    y: Bool?;
    z: String?;
    s: Slice?;
    c: Cell?;
    addr: Address?;
}

contract Test {
    inner: DeepOptional?;
    init() {
        self.inner = null;
    }
}