struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    p1: Int;
    p2: Bool;
    p3: Inner;
    
    init() {
        self.p1 = 1;
        self.p2 = true;
        self.p3 = Inner{a: 10, b: false};
    }
    
    receive() {}
}