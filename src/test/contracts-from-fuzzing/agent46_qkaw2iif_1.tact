struct Inner {
    val: Int;
}

contract Test {
    simpleVal: Int;
    nested: Inner;

    init() {
        self.simpleVal = 1;
        self.nested = Inner{ val: 42 };
    }
}