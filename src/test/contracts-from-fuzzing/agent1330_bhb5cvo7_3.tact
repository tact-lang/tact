struct Inner {
    val1: Int;
    val2: Bool?;
    val3: String?;
}

contract NestedOpt {
    field: Inner;

    init() {
        self.field = Inner{ val1: 5, val2: null, val3: "hello" };
    }
}