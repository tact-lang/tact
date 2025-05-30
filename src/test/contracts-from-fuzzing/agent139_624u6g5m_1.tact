struct Inner {
    x: Int;
    y: Int;
}

contract TestContract {
    pt: Inner;
    
    init() {
        self.pt = Inner{ x: 1, y: 2 };
    }
}