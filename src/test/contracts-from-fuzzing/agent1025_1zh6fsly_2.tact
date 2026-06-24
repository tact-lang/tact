struct Inner {
    flag: Bool;
    num: Int;
}

contract NestedStruct {
    s: Inner;

    init() {
        self.s = Inner{ flag: true, num: 42 };
    }
}
