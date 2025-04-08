struct Inner {
    x: Int;
    y: Bool;
}

contract Test {
    data: Inner;
    num: Int = 1;

    init() {
        self.data = Inner{ x: 42, y: true };
        self.num = 7;
    }
    
    receive() {
        let _ = self.num + self.data.x;
    }
}