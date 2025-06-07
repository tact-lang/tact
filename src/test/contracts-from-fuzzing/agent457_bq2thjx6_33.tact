struct OptionalChain {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test {
    opt: OptionalChain?;
    init() {
        self.opt = null;
    }
}