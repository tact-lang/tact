struct Deep {
    a: Int?;
    b: Bool?;
}

contract Test {
    optDeep: Deep?;

    init() {
        self.optDeep = null;
    }
}