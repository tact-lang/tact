struct Complex {
    x: Int?;
    y: Bool?;
}

contract Test {
    optComplex: Complex?;

    init() {
        self.optComplex = null;
    }
}