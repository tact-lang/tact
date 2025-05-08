struct Inner {
    val: Int as uint8;
}

contract Out {
    nested: Inner;
    init() {
        self.nested = Inner{ val: 300 };
    }
}