struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    val1: Int;
    val2: Inner;
    val3: Bool;
    
    init() {
        self.val1 = 1;
        self.val2 = Inner{a: 2, b: true};
        self.val3 = false;
    }
}
