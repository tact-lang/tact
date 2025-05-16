struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    val1: Int;
    val2: Bool;
    val3: Inner;
    
    init() {
        self.val1 = 1;
        self.val2 = true;
        self.val3 = Inner{a: 5, b: false};
    }
}