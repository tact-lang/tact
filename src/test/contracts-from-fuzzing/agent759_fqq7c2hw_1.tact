struct Inner {
    flag: Bool;
    number: Int as uint32;
}

contract TestContract {
    nested: Inner;
    basicFlag: Bool;
    basicNumber: Int;

    init() {
        self.nested = Inner{flag: true, number: 42};
        self.basicFlag = false;
        self.basicNumber = 7;
    }
}
