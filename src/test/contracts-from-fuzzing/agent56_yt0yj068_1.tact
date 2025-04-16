struct Inner {
    val: Int;
}

contract Test {
    nested: Inner;

    init() {
        self.nested = Inner{ val: 5 };
    }
}