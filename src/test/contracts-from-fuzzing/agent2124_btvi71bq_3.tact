struct Inner {
    val1: Int?;
    val2: Bool?;
    val3: Cell?;
}

contract OptionalNested {
    s: Inner;

    init() {
        self.s = Inner{ val1: null, val2: true, val3: null };
    }
}