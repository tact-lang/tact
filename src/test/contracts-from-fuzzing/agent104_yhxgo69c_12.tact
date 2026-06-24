struct Inner {
    val: Int;
    txt: String;
}

contract TestContract {
    val: Int;
    nested: Inner;
    flag: Bool;
    optStr: String?;
    init() {
        self.val = 42;
        self.nested = Inner{ val: 1, txt: "test" };
        self.flag = false;
        self.optStr = null;
    }
}