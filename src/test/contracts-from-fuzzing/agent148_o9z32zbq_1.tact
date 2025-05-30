struct Inner {
    a: Int;
    b: Bool;
}

contract TestDeepNested {
    outer: Inner;
    
    init() {
        self.outer = Inner{
            a: 1,
            b: true
        };
    }
}