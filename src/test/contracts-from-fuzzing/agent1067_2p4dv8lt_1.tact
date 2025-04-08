struct Inner {
    x: Int;
    y: Bool;
}

contract TestStorage {
    data: Inner;
    
    init() {
        self.data = Inner{ x: 5, y: true };
    }
}