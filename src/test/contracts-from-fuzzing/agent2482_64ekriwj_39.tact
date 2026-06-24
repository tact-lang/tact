struct S {
    a: Int;
    b: Int?;
}

contract Test {
    x: S?;
    init() {
        self.x = null;
    }
}