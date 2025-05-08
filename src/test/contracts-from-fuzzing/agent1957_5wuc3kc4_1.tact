struct Inner {
    x: Int;
    y: Int?;
}

contract DeepNested {
    data: Inner;
    
    init() {
        self.data = Inner{ x: 1, y: null };
    }
}