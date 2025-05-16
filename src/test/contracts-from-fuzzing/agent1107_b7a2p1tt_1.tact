struct Inner {
    flag: Bool;
    amount: Int;
}

contract TestContract {
    sfield: Inner;
    
    init() {
        self.sfield = Inner{flag: true, amount: 42};
    }
}