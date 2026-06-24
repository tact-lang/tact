struct Inner {
    innerVal: Int;
    flag: Bool;
    text: String;
}

contract NestedContract {
    inner: Inner = Inner{innerVal: 5, flag: true, text: "init"};

    init() {
        self.inner = Inner{innerVal: 42, flag: false, text: "set"};
    }

    receive() {
        let _ = self.inner;
    }
}