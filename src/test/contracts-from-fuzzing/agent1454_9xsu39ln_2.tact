struct Inner {
    val1: Int;
    val2: Bool;
}

contract Test {
    nested: Inner;

    init() {
        self.nested = Inner{ val1: 10, val2: true };
    }
}