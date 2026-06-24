struct OptPrims {
    a: Int?;
    b: Bool?;
}

contract NullDeep {
    s: OptPrims?;

    init() {
        self.s = null;
    }
}