struct Inner {
    a: Int;
    b: Bool?;
}

contract TestContract {
    x: Inner;
    
    init() {
        self.x = Inner{
            a: 10,
            b: true,
        };
    }
}