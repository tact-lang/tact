struct S {
    x: Int?;
    y: Bool?;
}

contract Test {
    a: S?;
    init() {
        self.a = null;
    }
}