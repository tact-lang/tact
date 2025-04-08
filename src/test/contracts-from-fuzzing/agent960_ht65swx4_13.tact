struct X {
    a: Int;
    b: Bool;
}

contract XOpt {
    data: X?;
    init() {
        self.data = null;
    }
}