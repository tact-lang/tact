struct Inner {
    x: Int;
    y: Int?;
}

contract FuzzTest {
    foo: Inner;
    
    init() {
        self.foo = Inner{ x: 1, y: null };
    }
}