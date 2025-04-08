struct Inner {
    val: Int?;
}

contract Test {
    nestedOpt: Inner;

    init() {
        self.nestedOpt = Inner{ val: null };
    }
}