struct X {
    a: Int;
    b: Bool;
}

contract Test {
    data: X?;
    init() {
        self.data = null;
    }
}