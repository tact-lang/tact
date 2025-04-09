struct Inner {
    val1: Int;
    val2: String;
    opt: Bool?;
}

contract Test {
    st: Inner;
    init() {
        self.st = Inner{ val1: 7, val2: "hello", opt: null };
    }
}