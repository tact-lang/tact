struct Inner {
    x: Int;
    y: Int?;
}

contract TestContract {
    data: Inner;
    
    init() {
        self.data = Inner{ x: 10, y: null };
    }
}