struct Inner {
    x: Int;
    y: Bool?;
}

contract TestNestedOptional {
    data: Inner;
    
    init() {
        self.data = Inner{ x: 42, y: null };
    }
}