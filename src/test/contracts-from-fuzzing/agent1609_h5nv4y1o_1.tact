struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    point: Inner;
    
    init() {
        self.point = Inner{
            foo: 123,
            bar: true,
        };
    }
    
    receive() {
        self.point = Inner{
            foo: 321,
            bar: false,
        };
    }
}