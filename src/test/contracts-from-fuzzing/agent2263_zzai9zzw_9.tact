struct Inner {
    a: Int?;
}

contract Test {
    s: Inner?;

    init() {
        self.s = null;
    }
}