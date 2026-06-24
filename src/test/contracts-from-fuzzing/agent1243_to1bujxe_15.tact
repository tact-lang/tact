struct Wrapper {
    x: Int;
    y: Int?;
}

contract Test {
    w: Wrapper?;
    init() {
        self.w = null;
    }
}