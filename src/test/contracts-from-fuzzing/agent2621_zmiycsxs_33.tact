struct ZeroFields {
    a: Int;
}

contract Test {
    arr: ZeroFields?;
    init() {
        self.arr = null;
    }
}