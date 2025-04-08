struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test {
    x: MultiOptional?;
    init() {
        self.x = null;
    }
}