struct Inner {
    a: Int;
}

contract TestContract {
    f1: Inner;
    f2: Inner;
    f3: Inner;
    
    init() {
        self.f1 = Inner{ a: 1 };
        self.f2 = Inner{ a: 2 };
        self.f3 = Inner{ a: 3 };
    }
}
