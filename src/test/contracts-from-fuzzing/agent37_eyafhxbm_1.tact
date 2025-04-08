struct Inner {
    flag: Bool;
    value: Int;
}

contract TestContract {
    st: Inner = Inner{flag: true, value: 123};
    
    init() {
        self.st = Inner{flag: false, value: 456};
    }
    receive() {}
}