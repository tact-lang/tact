struct Inner {
    a: Int;
    b: Bool;
}

contract NestedStructTest {
    x: Int = 1;
    y: Inner;
    
    init() {
        self.y = Inner{ a: 5, b: true };
    }
}