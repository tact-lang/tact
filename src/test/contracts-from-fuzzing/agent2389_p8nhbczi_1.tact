struct Inner {
    x: Int;
    y: Int?;
}

contract TestContract {
    innerField: Inner;
    
    init() {
        self.innerField = Inner{ x: 42, y: null };
    }
}